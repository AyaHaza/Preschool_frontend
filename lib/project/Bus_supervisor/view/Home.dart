import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Template.dart';

import '../Controller/Authentication/AuthController.dart';
import '../widgets/AppBar.dart';
import 'Profile/ProfileFormEdit.dart';
import '../widgets/blodText.dart';
class Home extends StatelessWidget {
  static const routeName = '/Home';
  AuthController controller =Get.put(AuthController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Template(body:Container(child:Center(child: TextBlod(text:"Hello", size: 100.sp,))) , title: 'Home',);
  }
}
