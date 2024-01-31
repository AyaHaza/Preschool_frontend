import 'package:get/get.dart';

import '../../Model/AllLessons.dart';
import 'LessonsController.dart';

class LessonsControllerScreen extends GetxController {
  LessonsController controller  =Get.find();

  var isLoading = false;
    String titleMsg="";
  String semesterMsg="";
  String numberMsg="";

  AllLesson? Data =AllLesson() ;
  AllLesson? EditedData =AllLesson();

  Future<void> Store() async {
     titleMsg="";
       semesterMsg="";
       numberMsg="";
    isLoading = true;
    update();
    await controller.Store(Data!);
    titleMsg = controller.titleMsg;
    semesterMsg = controller.semesterMsg;
    numberMsg = controller.numberMsg;
    isLoading = false;
    update();
  }
  //
  Future<void> Edit(int id,int classid) async {
     titleMsg="";
       semesterMsg="";
       numberMsg="";
    isLoading = true;
    EditedData!.id=id;
    update();
    // if(EditedData!.title==null)
    //   EditedData!.title=controller.AllLessons[id]!.levelId!;
    if( EditedData!.title!.compareTo(controller.allLessons[id]!.title!)!=0 ||
        EditedData!.semester!.compareTo(controller.allLessons[id]!.semester!)!=0
    || EditedData!.number!.compareTo(controller.allLessons[id]!.number!)!=0
    ){
      await controller.Edit(EditedData!,classid);
    }
    titleMsg = controller.titleMsg;
    semesterMsg = controller.semesterMsg;
    numberMsg = controller.numberMsg;
    isLoading = false;
    update();
  }

}
