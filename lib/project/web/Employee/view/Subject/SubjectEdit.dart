import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Template.dart';
import 'SubjectFormEdit.dart';

class SubjectEdit extends StatelessWidget {
  static const routeName = '/Subject/Edit';

  @override
  Widget build(BuildContext context) {
    return Template(
      text: 'Subject Edit', Content: SubjectFormEdit(id: Get.arguments[0]),);

  }
}
