import 'package:flutter/material.dart';
import '../../Template.dart';

import 'StudentAllContent.dart';


class StudentManagemet extends StatelessWidget {
  static const routeName = '/Student/Management';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Student Management', Content: StudentManagementContent(),);
  }
}
