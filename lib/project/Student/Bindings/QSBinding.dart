import 'package:get/get.dart';

import '../Controller/QuizeSytudent/QSController.dart';
import '../Controller/QuizeSytudent/QSScreenController.dart';


class QSBinding implements Bindings {
  @override
  void dependencies() async {
   Get.put<QSController>(QSController());
   Get.put<QSControllerScreen>(QSControllerScreen());

  }
}
