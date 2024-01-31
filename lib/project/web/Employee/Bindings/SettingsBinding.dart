import 'package:get/get.dart';

import '../Controller/BUSTracking/Location_screen_controller.dart';
import '../Controller/Bus/Vrp.dart';


class SettingsBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put<Location_screenController>(Location_screenController(), permanent: true);
    Get.put<VRPController>(VRPController(), permanent: true);

  }
}
