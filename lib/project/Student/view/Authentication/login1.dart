import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../widgets/ElevatedButton.dart';
import '../../widgets/blodText.dart';
import '../../widgets/logo.dart';
import 'login.dart';

class Login1 extends StatelessWidget {
  static const routeName = '/Login1';

  void login() {
    Get.toNamed(Login.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
    child: SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(220, 220, 220, 1.0),
        body: Center(
          child: Column(
              children: [
                Expanded(
                  child: Container(width: 300.w, height: 300.h, child: Logo()),
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextBlod(text: "Welcome",size:40.sp),
                Text(
                  "مرحباً بكم في تطبيق الروضة نتمنى أن ينال اعجابكم",
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30.h,
                ),
                ButtonElevated(
                    text: 'تسجيل الدخول',
                    function: login,
                    icon: Icon(Icons.login)),
                SizedBox(
                  height: 30.h,
                ),
              ]),
        )
        ),
      ),
    );
  }
}
