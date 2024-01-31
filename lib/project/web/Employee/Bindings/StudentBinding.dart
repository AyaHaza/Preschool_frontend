import 'package:get/get.dart';

import '../Controller/StudentMangement/StudentController.dart';
import '../Controller/StudentMangement/StudentScreenController.dart';

class StudentBinding implements Bindings {
  @override
  void dependencies() async {
   Get.put<StudentController>(StudentController(), permanent: true);
   Get.put<StudentControllerScreen>(StudentControllerScreen(), permanent: true);

  }
}
