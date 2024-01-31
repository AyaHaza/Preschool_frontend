import 'package:get/get.dart';

import '../../Model/AbsentStudent.dart';
import '../../Model/Student.dart';
import '../../view/Teacher_view/Attendance/ALLStudents.dart';
import '../Advertisement/Teacher/Classes.dart';
import 'Attendance.dart';

class AttendanceControllerScreen extends GetxController {
  AttendanceController controller = Get.find();
  var isLoading = false;
  DateTime? dateTime ;
  int? classid;
  Map<int?,List<bool?>>? init1absents={};
  TeacherClassController controller1= Get.find();

  @override
  Future<void> onInit() async {
    super.onInit();
    await init1();
  }
Future<void> init1() async {
    print("iiiiiiiiiiiiiiiiiiiinnnnnnnnnnnnnnnnnniiiiiiiiiiiiiiiiiitttttttttttt");
    controller1.teacher_classes_students.forEach((key, value) {
      List<bool?> list =List.filled(value.length, false);
      controller.TodayClassAbsentStudents[key]!.forEach((element) {
        int index = controller1.teacher_classes_students![key]!.indexWhere((student) => student.id==element.id);
        list[index]=true;
        print(element.id);
        print(index);
      });
      print(list);
      init1absents![key]=list;
    });
    print(init1absents);
    }

  Future<void> Fetch() async {
    isLoading = true;
    update();
    await controller.Fetch(dateTime, classid);
    Get.toNamed(ALLStudents.routeName);

    isLoading = false;
    update();
  }


  Future<void> AbsentPost(int key ) async {
  List<AbsentStudent>absent=[];
    init1absents![key]!.asMap().forEach((index,element) {
      if(element==true){
        Student student =controller1.teacher_classes_students![key]![index];
        AbsentStudent std= AbsentStudent(id:student.id,fullName: student.name);
        absent.add(std);
      }
    });
    await controller.Store(absent,key);
    update();
  }
}