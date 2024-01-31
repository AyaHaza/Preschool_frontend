import 'package:get/get.dart';

import '../Controller/Lessons/LessonsController.dart';
import '../Controller/Lessons/LessonsControllerScreen.dart';
import '../Controller/SubjectClasses/SubjectClassesController.dart';




class AllLessonsBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put<LessonsController>(LessonsController());
Get.put<LessonsControllerScreen>(LessonsControllerScreen());


  }
}
