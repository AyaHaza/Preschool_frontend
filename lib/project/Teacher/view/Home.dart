import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Template.dart';

import '../Controller/Authentication/AuthController.dart';
import '../widgets/AppBar.dart';
import 'Profile/ProfileFormEdit.dart';

class Home extends StatelessWidget {
  static const routeName = '/Home';
  AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Template(body:Container() , title: 'Home',);
  }
}
