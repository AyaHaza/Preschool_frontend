import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Template.dart';
import 'FeeForm.dart';


class FeeAdd extends StatelessWidget {
  static const routeName = '/Fee/Add';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Fee ADD', Content: FeeForm(),);
  }
}
