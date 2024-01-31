import 'package:get/get.dart';

import '../Controller/Attendance/Attendance.dart';
import '../Controller/Attendance/formScreen.dart';


class AttendanceScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AttendanceControllerScreen>(AttendanceControllerScreen());

  }
}
