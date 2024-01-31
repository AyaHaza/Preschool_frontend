import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Template.dart';
import 'configForm.dart';


class FeeConfigAdd extends StatelessWidget {
  static const routeName = '/Config/Fee/Add';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Fee Configuration ADD', Content: FeeConfigForm(),);
  }
}
