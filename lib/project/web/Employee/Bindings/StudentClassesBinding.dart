import 'package:get/get.dart';

import '../Controller/StudentClasses/StudentClassesControllker.dart';
import '../Controller/StudentClasses/StudentClassesScreenController.dart';
import '../Controller/StudentClasses/unStudentClassesController.dart';



class StudentClassesBinding implements Bindings {
  @override
  void dependencies() async {
  Get.put<unStudentClassesController>(unStudentClassesController());
  Get.put<StudentClassesController>(StudentClassesController());
  Get.put<StudentControllerScreenController>(StudentControllerScreenController());

  }
}
