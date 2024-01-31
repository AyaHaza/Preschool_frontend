import 'package:get/get.dart';
import 'package:project/project/Teacher/Controller/QuizeTeacher/QuizeTeacherScreenController.dart';
import '../Controller/QuizeTeacher/QuizeTeacherController.dart';



class QSBinding implements Bindings {
  @override
  void dependencies() async {
   Get.put<QuizeTeacherController>(QuizeTeacherController());

  Get.put<QuizeTeacherControllerScreen>(QuizeTeacherControllerScreen());

  }
}
