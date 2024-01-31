import 'package:get/get.dart';

import '../Controller/Report/Report.dart';

class ReportBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ReportController>(ReportController());
  }
}
