import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Template.dart';
import 'view1.dart';
class ExamsView extends StatelessWidget {
  static const routeName = '/Exams';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Exams View', Content: content(),);
  }
}
