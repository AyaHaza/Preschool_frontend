import 'package:get/get.dart';

import '../Controller/School/SchoolController.dart';

class SchoolBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SchoolController>(SchoolController(), permanent: true);
  }
}
