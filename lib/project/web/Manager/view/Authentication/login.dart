import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Controller/Authentication/login_screen.dart';
import '../../widgets/authCard.dart';
import '../../widgets/blodText.dart';
import '../../widgets/logo.dart';

class Login extends StatelessWidget {
  static const routeName = '/Login';
  LoginController controller = Get.put(LoginController(), permanent: true);

  Widget auth(BuildContext context, double size) {
    return Padding(
      padding: EdgeInsets.only(top: size),
      child: Column(children: [
        if (MediaQuery.of(context).size.height > 600)
          TextBlod(text: 'welcome', size: 60.sp),
        Expanded(child: AuthCard())
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GetBuilder<LoginController>(
        builder: (controller) => Center(
          child: AnimatedContainer(
            width: controller.tap == false ? 700.w : 600.w,
            height: 800.h,
            duration: Duration(microseconds: 40),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 40,
              child: Row(
                children: [
                  Expanded(child: Logo()),
                  MediaQuery.of(context).size.height < 200
                      ? auth(context, 0)
                      : auth(context, 70)
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
