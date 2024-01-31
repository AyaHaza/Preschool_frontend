import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Template.dart';
import 'UserManagementContent.dart';

class UserManagement extends StatelessWidget {
  static const routeName = '/User';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'User Management Page', Content: userpagecontent(),);
  }
}
