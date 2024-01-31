import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Template.dart';
import 'SchoolEditForm.dart';
class SchoolEdit extends StatelessWidget {
  static const routeName = '/School/Edit';

  @override
  Widget build(BuildContext context) {
    return Template(
      text: 'School Edit', Content: SchoolFormEdit());

  }
}
