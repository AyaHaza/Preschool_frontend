
import 'package:get/get.dart';

import '../../Model/AllTeacher.dart';
import 'AllTeacherController.dart';


class AllteacherControllerScreen extends GetxController {
  AllTeacherController controller  =Get.find();

  var isLoading = false;


  AllTeacher? Data =AllTeacher() ;
  AllTeacher? EditedData =AllTeacher();

  // Future<void> Store() async {
  //   String nameMsg="";
  //   String genderMsg="";
  //   String ageMsg="";
  //   String phoneMsg="";
  //   String locationMsg="";
  //   String birthdayMsg="";
  //   String motherNameMsg="";
  //   String motherNameLastMsg="";
  //   // String specializationMsg="";
  //   String healthInfoMsg="";
  //   String siblingNoMsg="";
  //   String bus_idMsg="";
  //   isLoading = true;
  //   update();
  //   await controller.Store(Data!);
  //   nameMsg = controller.nameMsg;
  //   genderMsg = controller.genderMsg;
  //   birthdayMsg = controller.birthdayMsg;
  //   phoneMsg = controller.phoneMsg;
  //   locationMsg = controller.locationMsg;
  //   motheNameMsg = controller.motherNameMsg;
  //   motheNameLastMsg = controller.motherNameLastMsg;
  //   siblingNoMsg=controller.siblingNoMsg;
  //   bus_idMsg=controller.bus_idMsg;
  //
  //   isLoading = false;
  //   update();
  // }
  //
  // Future<void> Edit(int id) async {
  //   print('dddddddddddddddddddddddddddddddddddddffffffffff');
  //   String nameMsg="";
  //   String genderMsg="";
  //   String ageMsg="";
  //   String phoneMsg="";
  //   String locationMsg="";
  //   String birthdayMsg="";
  //   String motherNameMsg="";
  //   String motherNameLastMsg="";
  //   // String specializationMsg="";
  //   String healthInfoMsg="";
  //   String siblingNoMsg="";
  //   String bus_idMsg="";
  //   isLoading = true;
  //   EditedData!.id=id;
  //   update();
  //   // if(EditedData!.levelId==null)
  //   //   EditedData!.levelId=controller.Classes[id]!.levelId!;
  //   if( EditedData!.fullName!.compareTo(controller.Classes[id]!.fullName!)!=0 ||
  //       EditedData!.gender!.compareTo(controller.Classes[id]!.gender!)!=0
  //       || EditedData!.birthday!.compareTo(controller.Classes[id]!.birthday!)!=0 ||
  //       EditedData!.age!.compareTo(controller.Classes[id]!.age!)!=0 ||
  //       EditedData!.phone!.compareTo(controller.Classes[id]!.phone!)!=0 ||
  //       EditedData!.location!.compareTo(controller.Classes[id]!.location!)!=0 ||
  //       EditedData!.healthyFood!.compareTo(controller.Classes[id]!.healthyFood!)!=0 ||
  //       EditedData!.motherName!.compareTo(controller.Classes[id]!.motherName!)!=0 ||
  //       EditedData!.motherLastName!.compareTo(controller.Classes[id]!.motherLastName!)!=0 ||
  //       EditedData!.siblingNo!.compareTo(controller.Classes[id]!.siblingNo!)!=0 ||
  //       EditedData!.bus_id!.compareTo(controller.Classes[id]!.bus_id!)!=0
  //
  //
  //   ){
  //     print('{editDtaa}${EditedData}');
  //     await controller.EditEmp(EditedData!);
  //   }
  //   nameMsg = controller.nameMsg;
  //   genderMsg = controller.genderMsg;
  //   birthdayMsg = controller.birthdayMsg;
  //   phoneMsg = controller.phoneMsg;
  //   locationMsg = controller.locationMsg;
  //   motheNameMsg = controller.motherNameMsg;
  //   motheNameLastMsg = controller.motherNameLastMsg;
  //   siblingNoMsg=controller.siblingNoMsg;
  //   bus_idMsg=controller.bus_idMsg;
  //
  //   isLoading = false;
  //   update();
  // }

}
