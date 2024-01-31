import 'package:get/get.dart';

import '../Controller/School/SchoolController.dart';
import '../Controller/School/School_screen.dart';

class SchoolBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SchoolController>(SchoolController(), permanent: true);
    Get.put<SchoolControllerScreen>(SchoolControllerScreen(), permanent: true);
  }
}
