import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Template.dart';
import 'ClassForm.dart';


class ClassAdd extends StatelessWidget {
  static const routeName = '/Class/Add';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Class ADD', Content: ClassForm(),);
  }
}
