import 'package:get/get.dart';

import '../Controller/Clasees/classController.dart';
import '../Controller/Clasees/class_Screen.dart';

class ClassBinding implements Bindings {
  @override
  void dependencies() async {
   Get.put<ClassController>(ClassController(), permanent: true);
   Get.put<ClassControllerScreen>(ClassControllerScreen(), permanent: true);

  }
}
