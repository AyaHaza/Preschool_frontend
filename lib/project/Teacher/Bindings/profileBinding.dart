import 'package:get/get.dart';
import 'package:project/project/Teacher/Controller/Authentication/AuthController.dart';
import 'package:project/project/Teacher/Controller/Authentication/Profile_screen.dart';



class ProfileBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put<AuthController>(AuthController());
    Get.put<ProfileControllerScreen>(ProfileControllerScreen());

  }
}
