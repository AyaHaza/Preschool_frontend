
import 'package:get/get.dart';

import '../../Model/Student.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import '../Authentication/AuthController.dart';

class Map_Controller extends GetxController {

  List<Student>Students =[];
  AuthController auth =Get.put(AuthController(), permanent: false);
  static const authEndpoint = "${AuthNetwork.baseUrl}/supervisor/bus/students";
  static const MapboxAccessToken = "xxxxxxxxxxx";

  @override
  Future<void> onInit() async {
    await Fetch();
    super.onInit();
  }
  Future<void> Fetch() async {
    try {
      final responseData = await Network.fetch("$authEndpoint/${auth.user!.id}");
      print(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;");
      print(responseData);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      Students.clear();
      responseData['data'].forEach((value) {
        Student student=Student.fromJson(value);
        Students.add(student);
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
}
