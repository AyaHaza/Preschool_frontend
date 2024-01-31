import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Template.dart';
import 'SubjectManagement.dart';

class SubjectManagemet extends StatelessWidget {
  static const routeName = '/Subject/Management';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Subject Management', Content: SubjectManagementContent(),);
  }
}
