import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Template.dart';
import 'StudentEditContent.dart';



class StudentEdit extends StatelessWidget {
  static const routeName = '/Student/Edit';

  @override
  Widget build(BuildContext context) {
    return Template(
      text: 'Student Edit', Content: StudentContentEdit(id: Get.arguments[0]),);

  }
}
