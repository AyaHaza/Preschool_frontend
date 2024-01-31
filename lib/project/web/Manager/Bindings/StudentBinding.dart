import 'package:get/get.dart';

import '../Controller/StudentMangement/StudentController.dart';

class StudentBinding implements Bindings {
  @override
  void dependencies() async {
   Get.put<StudentController>(StudentController());

  }
}
