import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Template.dart';
import 'Form.dart';
import 'LevelManagement.dart';

class LevelManagemet extends StatelessWidget {
  static const routeName = '/Level/Management';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Level Management', Content: LevelManagementContent(),);
  }
}
