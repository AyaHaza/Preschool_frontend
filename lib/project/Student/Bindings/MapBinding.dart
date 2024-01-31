import 'package:get/get.dart';

import '../Controller/BUS_Trucking/Map_Controller.dart';

class MapBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<Map_Controller>(Map_Controller(), permanent: true);
  }
}
