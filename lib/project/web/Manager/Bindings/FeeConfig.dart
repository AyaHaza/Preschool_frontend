import 'package:get/get.dart';

import '../Controller/Config/ConfigController.dart';
import '../Controller/Config/Config_Screen.dart';
import '../Controller/Config/FeeConfigController.dart';
import '../Controller/Config/Fee_Config_screen.dart';

class FeeConfigBinding implements Bindings {
  @override
  void dependencies()async {

    Get.put<FeeConfigController>(FeeConfigController(), permanent: true);
    Get.put<FeeConfigControllerScreen>(FeeConfigControllerScreen());


  }
}
