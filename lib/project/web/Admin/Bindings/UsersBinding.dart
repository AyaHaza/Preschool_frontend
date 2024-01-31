import 'package:get/get.dart';

import '../Controller/Users/UsersController.dart';
import '../Controller/Users/UsersScreenController.dart';

class UsersBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put<UsersController>(UsersController(), permanent: true);
    Get.put<UsersControllerScreen>(UsersControllerScreen(), permanent: true);

  }
}
