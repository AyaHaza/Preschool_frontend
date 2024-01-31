import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'StudentAddForm.dart';
import '../../Template.dart';




class StudentAdd extends StatelessWidget {
  static const routeName = '/Student/Add';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Student ADD', Content: StudentAddForm(),);
  }
}
