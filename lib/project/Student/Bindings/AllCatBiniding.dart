import 'package:get/get.dart';

import '../Controller/Categories/catScreenControlleer.dart';
import '../Controller/Categories/categoryController.dart';




class catBinding implements Bindings {
  @override
  void dependencies() async {
   Get.put<CatController>(CatController(), permanent: true);
   Get.put<catControllerScreen>(catControllerScreen(), permanent: true);


  }
}
