import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/Authentication/AuthController.dart';
import '../view/Authentication/login.dart';
class AuthMiddleware extends GetMiddleware {
  AuthController authController = Get.find();
  // //high
  // @override
  // int? get priority => 1;
  @override
  RouteSettings? redirect(String? route)
  {
    if(!authController.isAuth ||authController.user!.role!="manager"||authController.user!.status=="suspended")
      return RouteSettings(name: Login.routeName);
  }
}