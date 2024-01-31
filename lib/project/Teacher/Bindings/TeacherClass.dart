import 'package:get/get.dart';

import '../Controller/Advertisement/Teacher/Classes.dart';

class TeacherClassBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<TeacherClassController>(TeacherClassController(), permanent: true);
  }
}
