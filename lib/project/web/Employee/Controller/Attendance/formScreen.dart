import 'package:get/get.dart';

import '../../Model/AbsentStudent.dart';
import 'Attendance.dart';

class AttendanceControllerScreen extends GetxController {
  AttendanceController controller = Get.find();

  var isLoading = false;
  DateTime? dateTime ;
  int? classid;
   AbsentStudent? EditData;

  Future<void> Fetch() async {
    isLoading = true;
    update();
    print("Fetchhhhhhhhhhhhhhhhhh");
    print(dateTime);
    print(classid);
    await controller.Fetch(dateTime, classid);
    isLoading = false;
    update();
  }
  Future<void> Update() async {
    isLoading = true;
    update();
    await controller.Update(EditData!);
    isLoading = false;
    update();
  }
}