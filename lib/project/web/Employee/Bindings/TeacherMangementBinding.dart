import 'package:get/get.dart';

import '../Controller/Subject/SubjectController.dart';
import '../Controller/Subject/Subject_screen.dart';
import '../Controller/TeacherMangenent/AllTeacherController.dart';
import '../Controller/TeacherMangenent/AllTeacherScreenControoller.dart';


class TeacherMangementtBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AllTeacherController>(AllTeacherController());
     Get.put<AllteacherControllerScreen>(AllteacherControllerScreen());

  //
  // Get.put<SubjectController>(SubjectController());
  // Get.put<SubjectControllerScreen>(SubjectControllerScreen());
  }
}
