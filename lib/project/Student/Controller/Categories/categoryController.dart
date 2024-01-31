import 'package:get/get.dart';
import '../../Model/AlllCategory.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
class CatController extends GetxController{


  Map<int ,AllCategories>AllCateg ={};


  @override
  Future<void> onInit() async {
    super.onInit();
    await Fetch();
  }

  static const authEndpoint = "${AuthNetwork.baseUrl}/categories";


  Future<void> Store(AllCategories class1) async {
    try {
      print('llllllllllllllllllllllllllllllllllll');


      final responseData = await Network.Store(class1,'${authEndpoint}');

      AllCategories class2=AllCategories.fromJson(responseData['data']);
      AllCateg.addAll({class2.id! : class2 });
      update();
      Dialogs.Success("Added Successfully!");
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! < $e>");
    }
  }
  Future<void> Fetch() async {
    try {
      print(authEndpoint);
      final responseData = await Network.fetch(authEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      AllCateg.clear();
      responseData['data'].forEach((value) {
        AllCategories class1=AllCategories.fromJson(value);
        AllCateg.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
  // Future<void> EditEmp(Bus EditedData) async {
  //     capacityMsg="";
  //  numberMsg="";
  //  bus_supervisor_idMsg="";

  //   try {
  //     final responseData = await Network.EditEmp(EditedData,'${authEndpoint}');
  //     print('{eeeeeeeee}${responseData}');
  //     print('{eeeeeeeee}${responseData['status'].toString()}');

  //    if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

  //       if(responseData.containsKey('capacity')) {
  //         capacityMsg = responseData['capacity'].toString();
  //       }
  //       if(responseData.containsKey('number')) {
  //         numberMsg = responseData['number'].toString();
  //       }
  //       if(responseData.containsKey('bus_supervisor_id')) {
  //         bus_supervisor_idMsg = responseData['bus_supervisor_id'].toString();
  //       }

  //       return;
  //     }
  //     Buses[EditedData.id]!.capacity=EditedData.capacity;
  //     Buses[EditedData.id]!.number=EditedData.number;
  //     Buses[EditedData.id]!.bus_supervisor_id=EditedData.bus_supervisor_id;


  //     update();
  //     Dialogs.SuccessEdit("Updated Successfully!",BusManagemet.routeName);
  //   }  catch (e) {
  //     print(e);
  //     Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
  //   }
  // }

  Future<void> Delete(int id) async {
    try {
      final responseData = await Network.Delete(id,authEndpoint);

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      AllCateg.remove(id);
      update();
      Dialogs.Success(responseData['message']);

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