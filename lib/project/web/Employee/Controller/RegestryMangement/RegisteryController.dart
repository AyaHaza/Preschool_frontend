
import 'package:get/get.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../view/RegistryMangement/RegisteryAll/RegisteryAll.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import '../../Model/Registery.dart';
import '../Advertisement/Management/apis.dart';
class RegisteryController extends GetxController{


  Map<int ,Registery>Classes ={};
  String nameMsg="";
  String genderMsg="";
  String ageMsg="";
  String phoneMsg="";
  String locationMsg="";
  String birthdayMsg="";
  String degreeMsg="";
  String roleMsg="";
  String specializationMsg="";
  String healthInfoMsg="";



  @override
  Future<void> onInit() async {
    super.onInit();
    await Fetch();
  }

  static const authEndpoint = "${AuthNetwork.baseUrl}/employee";
  static const AllEndpoint = "${AuthNetwork.baseUrl}/employees";

  Future<void> Store(Registery class1) async {
    try {
    nameMsg="";
   genderMsg="";
   ageMsg="";
   phoneMsg="";
   locationMsg="";
   birthdayMsg="";
   degreeMsg="";
   roleMsg="";
   specializationMsg="";
   healthInfoMsg="";
      final responseData = await Network.Store(class1,'${authEndpoint}/store');
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

        if(responseData.containsKey('fullName')) {
          nameMsg = responseData['fullName'].toString();
        }
        if(responseData.containsKey('gender')) {
          genderMsg = responseData['gender'].toString();
        }
        if(responseData.containsKey('birthday')) {
          birthdayMsg = responseData['birthday'].toString();
        }
          if(responseData.containsKey('phone')) {
          phoneMsg = responseData['phone'].toString();
        }
         if(responseData.containsKey('location')) {
          locationMsg = responseData['location'].toString();
        }
         if(responseData.containsKey('degree')) {
          degreeMsg = responseData['degree'].toString();
        }
         if(responseData.containsKey('role')) {
          roleMsg = responseData['role'].toString();
        }
        return;
      }
      Registery class2=Registery.fromJson(responseData['data']);
      Classes.addAll({class2.id! : class2 });
      print("fffffffffffffffffffffffffffdddddddddddddddssssssssssssssssssssssssssssssssssssssssss");
      APIs.StoreUser(class2.role!, class2.id!, class2.fullName!);
      update();
      Dialogs.Success("Added Successfully!");
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! < $e>");
    }
  }
  Future<void> Fetch() async {
    try {
      final responseData = await Network.fetch(AllEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      Classes.clear();
      responseData['data'].forEach((value) {
        Registery class1=Registery.fromJson(value);
        Classes.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
  Future<void> Edit(Registery EditedData) async {
     nameMsg="";
   genderMsg="";
   ageMsg="";
   phoneMsg="";
   locationMsg="";
   birthdayMsg="";
   degreeMsg="";
   roleMsg="";
   specializationMsg="";
   healthInfoMsg="";
    try {
      print("Ffffffffff");
      print(EditedData.birthday);
      final responseData = await Network.Store(EditedData,"$authEndpoint/${EditedData.id}");

    if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

        if(responseData.containsKey('fullName')) {
          nameMsg = responseData['fullName'].toString();
        }
        if(responseData.containsKey('gender')) {
          genderMsg = responseData['gender'].toString();
        }
        if(responseData.containsKey('birthday')) {
          birthdayMsg = responseData['birthday'].toString();
        }
          if(responseData.containsKey('phone')) {
          phoneMsg = responseData['phone'].toString();
        }
         if(responseData.containsKey('location')) {
          locationMsg = responseData['location'].toString();
        }
         if(responseData.containsKey('degree')) {
          degreeMsg = responseData['degree'].toString();
        }
         if(responseData.containsKey('role')) {
          roleMsg = responseData['role'].toString();
        }
        return;
      }
      Classes[EditedData.id]!.fullName=EditedData.fullName;
      Classes[EditedData.id]!.gender=EditedData.gender;
      Classes[EditedData.id]!.birthday=EditedData.birthday;
      Classes[EditedData.id]!.phone=EditedData.phone;
      Classes[EditedData.id]!.location=EditedData.location;
      Classes[EditedData.id]!.healthyFood=EditedData.healthyFood;
      Classes[EditedData.id]!.degree=EditedData.degree;
      Classes[EditedData.id]!.specialization=EditedData.specialization;
      Classes[EditedData.id]!.role=EditedData.role;

      update();
      Dialogs.SuccessEdit("Updated Successfully!",RegisteryManagemet.routeName);
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
      APIs.DeleteUser(Classes[id]!.role!,id);
      Classes.remove(id);

      update();
      Dialogs.Success(responseData['data']);

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }

}