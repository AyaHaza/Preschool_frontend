
import 'package:get/get.dart';

import '../../Model/UserMang.dart';
import 'UsersController.dart';


class UsersControllerScreen extends GetxController {
 UsersController controller  =Get.find();

 var isLoading = false;
 String nameMsg="";
 String roleMsg="";
 String statusMsg="";

 UserMang? Data =UserMang() ;
 UserMang? EditedData =UserMang();

 Future<void> Store() async {
  nameMsg="";
  roleMsg="";
  statusMsg="";
  isLoading = true;
  update();

  nameMsg = controller.nameMsg;
  roleMsg = controller.roleMsg;
  statusMsg = controller.statusMsg;


  isLoading = false;
  update();
 }

 Future<void> Edit(int id) async {
  print('dddddddddddddddddddddddddddddddddddddffffffffff');
  nameMsg="";
  roleMsg="";
  statusMsg="";
  isLoading = true;
  EditedData!.id=id;
  update();
  // if(EditedData!.levelId==null)
  //   EditedData!.levelId=controller.users[id]!.levelId!;
  if( EditedData!.name!.compareTo(controller.users[id]!.name!)!=0 ||
      EditedData!.role!.compareTo(controller.users[id]!.role!)!=0
      || EditedData!.status!.compareTo(controller.users[id]!.status!)!=0


  ){
   print('{editDtaa}${EditedData}');
   await controller.Edit(EditedData!);
  }
  nameMsg = controller.nameMsg;
  roleMsg = controller.roleMsg;
  statusMsg = controller.statusMsg;

  isLoading = false;
  update();
 }

}
