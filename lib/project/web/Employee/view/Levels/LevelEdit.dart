import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Template.dart';
import 'Form.dart';
import 'LevelFormEdit.dart';

class LevelEdit extends StatelessWidget {
  static const routeName = '/Level/Edit';

  @override
  Widget build(BuildContext context) {
      return Template(
        text: 'Level Edit', Content: LevelFormEdit(id: Get.arguments[0]),);

  }
}
