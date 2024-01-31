import 'package:get/get.dart';
import '../Controller/CountStudent/CountStudentController.dart';


class CountBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<StudentCountController>(StudentCountController());
  }
}
