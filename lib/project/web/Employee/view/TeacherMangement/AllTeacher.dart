import 'package:flutter/material.dart';

import '../Template.dart';
import 'AllTeacherSubjects.dart';



class TeacherManagemet extends StatelessWidget {
  static const routeName = '/Teacher/Management';
  @override
  Widget build(BuildContext context) {
    return
      Template(text: 'Teacheres Management', Content: TeacherManagementContent(),);
  }
}
