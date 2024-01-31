import 'package:get/get.dart';

import '../../Model/AllHomework.dart';
import 'HomeworkController.dart';
class HomeworkControllerScreen extends GetxController {
  HomeworkController controller  =Get.find();

  var isLoading = false;
    String page_numberMsg="";
  String descriptionMsg="";

  AllHomework? Data =AllHomework() ;
  AllHomework? EditedData =AllHomework();

  Future<void> Store() async {
     page_numberMsg="";
       descriptionMsg="";
    isLoading = true;
    update();
    await controller.Store(Data!);
    page_numberMsg = controller.page_numberMsg;
    descriptionMsg = controller.descriptionMsg;
 
    isLoading = false;
    update();
  }
  //
  Future<void> Edit(int id) async {
    page_numberMsg="";
       descriptionMsg="";
    isLoading = true;
    EditedData!.id=id;
    update();
    // if(EditedData!.title==null)
    //   EditedData!.title=controller.AllLessons[id]!.levelId!;
    if( EditedData!.page_number!.compareTo(controller.allHomeworks[id]!.page_number!)!=0 ||
        EditedData!.description!.compareTo(controller.allHomeworks[id]!.description!)!=0
     ){
      await controller.Edit(EditedData!);
    }
    page_numberMsg = controller.page_numberMsg;
    descriptionMsg = controller.descriptionMsg;
    isLoading = false;
    update();
  }

}
