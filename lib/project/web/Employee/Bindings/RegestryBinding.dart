import 'package:get/get.dart';

import '../Controller/RegestryMangement/RegisteryController.dart';
import '../Controller/RegestryMangement/RegistryScreenController.dart';


class RegisteryBinding implements Bindings {
  @override
  void dependencies() async {
   Get.put<RegisteryController>(RegisteryController(), permanent: true);
   Get.put<RegisteryControllerScreen>(RegisteryControllerScreen(), permanent: true);

  }
}
