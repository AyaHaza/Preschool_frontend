import 'package:get/get.dart';

import '../Controller/StudentFee/FeeController.dart';
import '../Controller/StudentFee/Fee_screen.dart';

class FeeBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put<FeeController>(FeeController(), permanent: true);
    Get.put<FeeControllerScreen>(FeeControllerScreen(), permanent: true);

  }
}
