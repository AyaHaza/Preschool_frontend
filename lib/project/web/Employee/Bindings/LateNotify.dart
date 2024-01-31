import 'package:get/get.dart';
import 'package:project/project/web/Employee/Controller/CountStudent/CountStudentController.dart';

import '../Controller/LateNotification/LateNotification.dart';
import '../Controller/Levels/LevelController.dart';
import '../Controller/Levels/Level_Screen.dart';

class LateNotifyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LateNotifyController>(LateNotifyController(), permanent: true);
  }
}
