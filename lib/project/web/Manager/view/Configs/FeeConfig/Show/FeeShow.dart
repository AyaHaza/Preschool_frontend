import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Template.dart';
import 'FeeConfig.dart';


class YearFeeConfigShow extends StatelessWidget {
  static const routeName = '/Year/Config/Fee/view';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Students Fee Configuration', Content: FeeManagementContent(),);
  }
}
