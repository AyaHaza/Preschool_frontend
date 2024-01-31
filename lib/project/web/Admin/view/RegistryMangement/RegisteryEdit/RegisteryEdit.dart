import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Template.dart';
import 'RegisteryEditContent.dart';


class RegisteryEdit extends StatelessWidget {
  static const routeName = '/Registery/Edit';

  @override
  Widget build(BuildContext context) {
    return Template(
      text: 'Registery Edit', Content: RegisteryContentEdit(id: Get.arguments[0]),);

  }
}
