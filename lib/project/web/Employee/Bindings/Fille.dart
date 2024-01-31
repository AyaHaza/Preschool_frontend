import 'package:get/get.dart';

import '../Controller/FileManagement/FileController.dart';
import '../Controller/FileManagement/FileControllerScreen.dart';
import '../Controller/Levels/LevelController.dart';
import '../Controller/Levels/Level_Screen.dart';

class FileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FileController>(FileController(), permanent: true);
    Get.put<FileControllerScreen>(FileControllerScreen(), permanent: true);
  }
}
