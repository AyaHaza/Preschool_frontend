import 'package:get/get.dart';

import '../Controller/RegestryMangement/RegisteryController.dart';


class RegisteryBinding implements Bindings {
  @override
  void dependencies() async {
   Get.put<RegisteryController>(RegisteryController(), permanent: true);

  }
}
