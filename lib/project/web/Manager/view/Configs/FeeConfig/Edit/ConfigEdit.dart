import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Template.dart';
import 'ConfigEditForm.dart';

class YearConfigEdit extends StatelessWidget {
  static const routeName = '/year/Config/Edit';

  @override
  Widget build(BuildContext context) {
    return Template(
      text: 'Configuration Edit', Content: YearConfigFormEdit(id: Get.arguments[0]),);

  }
}
