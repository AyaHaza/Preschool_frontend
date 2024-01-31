import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ShowContent.dart';
import '../Template.dart';

class ReportView extends StatelessWidget {
  static const routeName = '/Report';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Report View', Content: pagecontent(),);
  }
}
