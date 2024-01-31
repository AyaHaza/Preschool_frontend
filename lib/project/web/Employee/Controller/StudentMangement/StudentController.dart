
import 'package:get/get.dart';
import '../../Model/Student.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../view/StudentMangement/StudentAll/StudentAll.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import '../Advertisement/Management/apis.dart';
class StudentController extends GetxController{


  Map<int ,Student>Classes ={};
  String nameMsg="";
  String genderMsg="";
  String phoneMsg="";
  String locationMsg="";
  String birthdayMsg="";
  String motherNameMsg="";
  String motherNameLastMsg="";
 // String specializationMsg="";
  String healthInfoMsg="";
  String siblingNoMsg="";
  String bus_idMsg="";


  @override
  Future<void> onInit() async {
    super.onInit();
    await Fetch();
  }

  static const authEndpoint = "${AuthNetwork.baseUrl}/student";
  static const AllEndpoint = "${AuthNetwork.baseUrl}/students";

  Future<void> Store(Student class1) async {
    try {
        nameMsg="";
   genderMsg="";
   phoneMsg="";
   locationMsg="";
   birthdayMsg="";
   motherNameMsg="";
   motherNameLastMsg="";
   //specializationMsg="";
   healthInfoMsg="";
   siblingNoMsg="";
   bus_idMsg="";
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
         if(responseData.containsKey('motherName')) {
          motherNameMsg = responseData['motherName'].toString();
        }
         if(responseData.containsKey('motherLastName')) {
          motherNameLastMsg = responseData['motherLastName'].toString();
        }
         if(responseData.containsKey('siblingNo')) {
          siblingNoMsg = responseData['siblingNo'].toString();
        }
         if(responseData.containsKey('bus_id')) {
          bus_idMsg = responseData['bus_id'].toString();
        }
        return;
      }
      Student class2=Student.fromJson(responseData['data']);
      Classes.addAll({class2.id! : class2 });
      APIs.StoreUser("Student", class2.id!, class2.fullName!);

        update();
      Dialogs.Success("Added Successfully!");
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! < $e>");
    }
  }
  Future<void> Fetch() async {
    try {
      print("Student Fetch");

      final responseData = await Network.fetch(AllEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
print("Ddddddddddddddddddddddd");
      Classes.clear();
      responseData['data'].forEach((value) {
        Student class1=Student.fromJson(value);
        Classes.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
  Future<void> Edit(Student EditedData) async {
     nameMsg="";
   genderMsg="";
   phoneMsg="";
   locationMsg="";
   birthdayMsg="";
   motherNameMsg="";
   motherNameLastMsg="";
   //specializationMsg="";
   healthInfoMsg="";
   siblingNoMsg="";
   bus_idMsg="";
    try {
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
         if(responseData.containsKey('motherName')) {
          motherNameMsg = responseData['motherName'].toString();
        }
         if(responseData.containsKey('motherLastName')) {
          motherNameLastMsg = responseData['motherLastName'].toString();
        }
         if(responseData.containsKey('siblingNo')) {
          siblingNoMsg = responseData['siblingNo'].toString();
        }
         if(responseData.containsKey('bus_id')) {
          bus_idMsg = responseData['bus_id'].toString();
        }
        return;
      }
      Classes[EditedData.id]!.fullName=EditedData.fullName;
      Classes[EditedData.id]!.gender=EditedData.gender;
      Classes[EditedData.id]!.birthday=EditedData.birthday;
      Classes[EditedData.id]!.phone=EditedData.phone;
      Classes[EditedData.id]!.location=EditedData.location;
      Classes[EditedData.id]!.healthyFood=EditedData.healthyFood;
      Classes[EditedData.id]!.motherName=EditedData.motherName;
      Classes[EditedData.id]!.motherLastName=EditedData.motherLastName;
      Classes[EditedData.id]!.siblingNo=EditedData.siblingNo;
Classes[EditedData.id]!.bus_id=EditedData.bus_id;
      update();
      Dialogs.SuccessEdit("Updated Successfully!",StudentManagemet.routeName);
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
      Classes.remove(id);
      update();
      Dialogs.Success(responseData['data']);
      APIs.DeleteUser("Student",id);

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }


}