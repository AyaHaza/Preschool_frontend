import 'package:get/get.dart';

import '../Controller/BUS_Trucking/Start_UP_screen_controller.dart';

class Startup_LocationBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put<Startup_screenController>(Startup_screenController());
  }
}
