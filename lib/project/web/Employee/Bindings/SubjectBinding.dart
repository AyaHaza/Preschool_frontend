import 'package:get/get.dart';

import '../Controller/Subject/SubjectController.dart';
import '../Controller/Subject/Subject_screen.dart';

class SubjectBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SubjectController>(SubjectController(), permanent: true);
    Get.put<SubjectControllerScreen>(SubjectControllerScreen(), permanent: true);
  }
}
