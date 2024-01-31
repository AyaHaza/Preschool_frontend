import 'package:get/get.dart';

import '../Controller/Attendance/Attendance.dart';
import '../Controller/Attendance/formScreen.dart';


class AttendanceBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AttendanceController>(AttendanceController(), permanent: true);
    Get.put<AttendanceControllerScreen>(AttendanceControllerScreen(), permanent: true);

  }
}
