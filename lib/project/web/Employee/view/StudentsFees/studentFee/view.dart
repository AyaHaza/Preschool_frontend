import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Controller/StudentMangement/StudentController.dart';
import '../../../Model/Student.dart';
import '../../Template.dart';
import 'Table.dart';
import 'fetchform.dart';


class FeeStudentview extends StatelessWidget {
  static const routeName = '/Fee/student/view';
  StudentController controller =Get.find();
  @override
  Widget build(BuildContext context) {
    Student student = controller.Classes.values.where((element) => element.id!.compareTo(Get.arguments[0])==0).first;
    return Template(text: 'Student Fee for ${student.fullName}', Content: FeeStudentsContent(id: Get.arguments[0]),);
  }
}
