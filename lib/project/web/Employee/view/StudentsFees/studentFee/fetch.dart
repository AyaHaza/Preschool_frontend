import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Template.dart';
import 'fetchform.dart';


class Feefetch extends StatelessWidget {
  static const routeName = '/Fee/student';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Student Fee', Content: FeefetchForm(),);
  }
}
