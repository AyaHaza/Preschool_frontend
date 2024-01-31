import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/Authentication/AuthController.dart';
import '../view/Authentication/login.dart';
import '../view/Authentication/login1.dart';
import '../Controller/Authentication/services.dart';
class AuthMiddleware extends GetMiddleware {
  static MyServices myServices= Get.find();
  @override
  RouteSettings? redirect(String? route)
  {
    if (!myServices.sharedPreferences.containsKey('userData')) {
      return const RouteSettings(name: Login1.routeName);
    }
    return null;
  }

}