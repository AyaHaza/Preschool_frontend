import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Template.dart';
import 'ClassEditForm.dart';

class ClassEdit extends StatelessWidget {
  static const routeName = '/Class/Edit';

  @override
  Widget build(BuildContext context) {
    return Template(
      text: 'Class Edit', Content: ClassFormEdit(id: Get.arguments[0]),);

  }
}
