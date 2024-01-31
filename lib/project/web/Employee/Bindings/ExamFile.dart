import 'package:get/get.dart';

import '../Controller/Exams/FileExamController.dart';
import '../Controller/FileManagement/FileController.dart';
import '../Controller/FileManagement/FileControllerScreen.dart';
import '../Controller/Levels/LevelController.dart';
import '../Controller/Levels/Level_Screen.dart';

class ExamFileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FileExamController>(FileExamController());
  }
}
