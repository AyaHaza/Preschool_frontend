
import 'package:get/get.dart';

import '../../Model/Location.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import '../Authentication/AuthController.dart';

class Startup_screenController extends GetxController {
  var isLoading = false;
  String msg="";
  static const authEndpoint = "${AuthNetwork.baseUrl}/update/student/location";
  AuthController controller =Get.find();

  Future<void> Edit(Location location) async {
    msg="";
    isLoading=true;
    update();
    try {
      final responseData = await Network.Store(location,"$authEndpoint/${controller.user!.id}");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        // if(responseData.containsKey('name')) {
        //   nameMsg = responseData['name'].toString();
      // }
        msg="error";
        isLoading=false;
        return;
      }
      isLoading=false;
      update();
      Dialogs.SuccessEdit("Updated Successfully!",'/');
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
}