import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Template.dart';
import 'classManagement.dart';

class ClassManagemet extends StatelessWidget {
  static const routeName = '/Classes/Management';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Classes Management', Content: ClassManagementContent(),);
  }
}
