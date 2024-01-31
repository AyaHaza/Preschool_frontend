import 'package:get/get.dart';

import '../Controller/Levels/LevelController.dart';
import '../Controller/Levels/Level_Screen.dart';

class LevelBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LevelController>(LevelController(), permanent: true);
    Get.put<LevelControllerScreen>(LevelControllerScreen(), permanent: true);
  }
}
