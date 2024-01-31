
import 'package:get/get.dart';
import '../../Model/UserMang.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../view/UserManagement/UserAll/UserManagementPage.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
class UsersController extends GetxController{


  Map<int ,UserMang>users ={};
  String nameMsg="";
  String roleMsg="";
  String statusMsg="";


  @override
  Future<void> onInit() async {
    super.onInit();
    await Fetch();
  }

  static const authEndpoint = "${AuthNetwork.baseUrl}/user";
  static const AllEndpoint = "${AuthNetwork.baseUrl}/users";

  Future<void> Fetch() async {
    try {
      final responseData = await Network.fetch("${AuthNetwork.baseUrl}/users");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      users.clear();
      responseData['data'].forEach((value) {
        UserMang class1=UserMang.fromJson(value);
        users.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
  Future<void> Edit(UserMang EditedData) async {
    print("objecthhhhhhhhhhhhhhhh");
    nameMsg="";
    roleMsg="";
    statusMsg="";

    try {
      final responseData = await Network.Store(EditedData,"${AuthNetwork.baseUrl}/user/${EditedData.id}");

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

        if(responseData.containsKey('name')) {
          nameMsg = responseData['name'].toString();
        }
        if(responseData.containsKey('role')) {
          roleMsg = responseData['role'].toString();
        }
        if(responseData.containsKey('status')) {
          statusMsg = responseData['status'].toString();
        }


        return;
      }
      users[EditedData.id]!.name=EditedData.name;
      users[EditedData.id]!.role=EditedData.role;
      users[EditedData.id]!.status=EditedData.status;

      update();
      Dialogs.SuccessEdit("Updated Successfully!",UserManagement.routeName);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> EditEmp(UserMang EditedData) async {
    nameMsg="";
    nameMsg="";
    roleMsg="";
    statusMsg="";
    try {
      final responseData = await Network.EditEmp(EditedData,authEndpoint);

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

        if(responseData.containsKey('name')) {
          nameMsg = responseData['name'].toString();
        }
        if(responseData.containsKey('role')) {
          roleMsg = responseData['role'].toString();
        }
        if(responseData.containsKey('status')) {
          statusMsg = responseData['status'].toString();
        }
      }
      users[EditedData.id]!.name=EditedData.name;
      users[EditedData.id]!.role=EditedData.role;
      users[EditedData.id]!.status=EditedData.status;
      update();
      Dialogs.SuccessEdit("Updated Successfully!",UserManagement.routeName);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }

  Future<void> Delete(int id) async {
    try {
      final responseData = await Network.Delete(id,authEndpoint);

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      users.remove(id);
      update();
      Dialogs.Success(responseData['data']);

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
//  Future<void>? DeleteEmp(id)async{


//        await Network.DeleteEmp(id,authEndpoint);

//      update();
//  }

}