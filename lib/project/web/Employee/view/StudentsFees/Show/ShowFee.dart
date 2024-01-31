import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Template.dart';
import 'ShowContent.dart';


class FeeConfigShow extends StatelessWidget {
  static const routeName = '/Config/Fee/view';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'All Students Fee', Content: pagecontent(),);
  }
}
