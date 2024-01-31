import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Template.dart';
import 'UserEditContent.dart';




class UserEdit extends StatelessWidget {
  static const routeName = '/User/Edit';

  @override
  Widget build(BuildContext context) {
    return Template(
      text: 'User Edit', Content: UserContentEdit(id: Get.arguments[0]),);

  }
}
