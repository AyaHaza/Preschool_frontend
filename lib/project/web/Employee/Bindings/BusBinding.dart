import 'package:get/get.dart';

import '../Controller/Bus/BusController.dart';
import '../Controller/Bus/BusScreenController.dart';

class BusBinding implements Bindings {
  @override
  void dependencies() async {
   Get.put<BusController>(BusController(), permanent: true);
   Get.put<BusControllerScreen>(BusControllerScreen(), permanent: true);

  }
}
