
import 'package:get/get.dart';
import '../../Model/Registery.dart';
import 'RegisteryController.dart';

class RegisteryControllerScreen extends GetxController {
  RegisteryController controller  =Get.find();

  var isLoading = false;
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

  Registery? Data =Registery() ;
  Registery? EditedData =Registery();

  Future<void> Store() async {
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
    isLoading = true;

    if(Data!.gender==null) {
      Data!.gender = "male";
    }
  if(Data!.degree==null) {
    Data!.degree = "bachalor";
  } if(Data!.role==null) {
    Data!.role = "employee";
  }
    update();
    await controller.Store(Data!);
     nameMsg = controller.nameMsg;
    genderMsg = controller.genderMsg;
   birthdayMsg = controller.birthdayMsg;
    phoneMsg = controller.phoneMsg;
   locationMsg = controller.locationMsg;
    degreeMsg = controller.degreeMsg;
   roleMsg = controller.roleMsg;
  
   
    isLoading = false;
    update();
  }
  
  Future<void> Edit(int id) async {
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
    isLoading = true;
    EditedData!.id=id;
    update();
print("lllllllllllllllll");
print(EditedData!.fullName);
    print(EditedData!.gender);
    print(EditedData!.phone);
    print(EditedData!.specialization);
    print(EditedData!.location);
    print(EditedData!.healthyFood);
    print(EditedData!.degree);

    // if(EditedData!.levelId==null)
    //   EditedData!.levelId=controller.Classes[id]!.levelId!;
    // if( EditedData!.fullName!.compareTo(controller.Classes[id]!.fullName!)!=0 ||
    //     EditedData!.gender!.compareTo(controller.Classes[id]!.gender!)!=0
    // || EditedData!.birthday!.compareTo(controller.Classes[id]!.birthday!)!=0 ||
    // EditedData!.phone!.compareTo(controller.Classes[id]!.phone!)!=0 ||
    // EditedData!.location!.compareTo(controller.Classes[id]!.location!)!=0 ||
    // EditedData!.healthyFood!.compareTo(controller.Classes[id]!.healthyFood!)!=0 ||
    // EditedData!.degree!.compareTo(controller.Classes[id]!.degree!)!=0 ||
    // EditedData!.specialization!.compareTo(controller.Classes[id]!.specialization!)!=0 ||
    // EditedData!.role!.compareTo(controller.Classes[id]!.role!)!=0
    //
    // ){
    //  print("77777777777777777");

     await controller.Edit(EditedData!);
     // }
    nameMsg = controller.nameMsg;
    genderMsg = controller.genderMsg;
   birthdayMsg = controller.birthdayMsg;
    phoneMsg = controller.phoneMsg;
   locationMsg = controller.locationMsg;
    degreeMsg = controller.degreeMsg;
   roleMsg = controller.roleMsg;
  
    isLoading = false;
    update();
  }

}
