import 'package:get/get.dart';

import '../Controller/Exams/EaxmsController.dart';
import '../Controller/Exams/ExamsScreenController.dart';



class AllExamBinding implements Bindings {
  @override
  void dependencies() async {
   Get.put<ExamConrtroller>(ExamConrtroller());
   Get.put<examsControllerScreen>(examsControllerScreen());

  }
}
