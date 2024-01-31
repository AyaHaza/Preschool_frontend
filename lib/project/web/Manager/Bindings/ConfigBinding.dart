import 'package:get/get.dart';

import '../Controller/Config/ConfigController.dart';
import '../Controller/Config/Config_Screen.dart';

class ConfigBinding implements Bindings {
  @override
  void dependencies() {
      Get.put<ConfigController>(ConfigController(), permanent: true);
      Get.put<ConfigControllerScreen>(ConfigControllerScreen(), permanent: true);

  }
}
