import 'package:get/get.dart';

import '../Controller/HomeWork/HomeworkContollerScreen.dart';
import '../Controller/HomeWork/HomeworkController.dart';



class AllHomewokBinding implements Bindings {
  @override
  void dependencies() async {
   Get.put<HomeworkController>(HomeworkController());
   Get.put<HomeworkControllerScreen>(HomeworkControllerScreen());

  }
}
