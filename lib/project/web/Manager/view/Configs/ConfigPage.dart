import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Template.dart';
import 'configManagement.dart';

class ConfigManagemet extends StatelessWidget {
  static const routeName = '/Config/Management';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Configuration Management', Content: ConfigManagementContent(),);
  }
}
