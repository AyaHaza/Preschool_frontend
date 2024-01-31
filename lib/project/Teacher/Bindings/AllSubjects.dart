import 'package:get/get.dart';

import '../Controller/SubjectClasses/SubjectClassesController.dart';
import '../Controller/Subjects/SubjectsController.dart';




class AllSubBinding implements Bindings {
  @override
  void dependencies() async {
   Get.put<SubjectsrController>(SubjectsrController());
   Get.put<SubClassesController>(SubClassesController());

  }
}
