import 'package:flutter/material.dart';
import '../../Template.dart';
import 'RegesterAllContent.dart';


class RegisteryManagemet extends StatelessWidget {
  static const routeName = '/Registery/Management';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Registery Management', Content: RegisteryManagementContent(),);
  }
}
