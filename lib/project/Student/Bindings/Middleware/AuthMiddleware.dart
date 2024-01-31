import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/Authentication/AuthController.dart';

class AuthMiddleware extends GetMiddleware {
  AuthController authController = Get.find();

  @override
  RouteSettings? redirect(String? route)
  {
    // if(!authController.isAuth)
    //   return RouteSettings(name: Login1.routeName);
  }

}