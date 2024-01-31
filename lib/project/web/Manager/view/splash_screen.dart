import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/project/web/Employee/view/Authentication/login.dart';

import '../Controller/Authentication/AuthController.dart';
import '../widgets/logo.dart';

class SplashScreen extends StatelessWidget {
    static const routeName = '/Splash';

  @override
  Widget build(BuildContext context) {
    AuthController controller =Get.find();

    return Scaffold(
      body: Center(
        child:
          CircularProgressIndicator(backgroundColor: Theme.of(context).primaryColor,)
        )
    );
  }
}
