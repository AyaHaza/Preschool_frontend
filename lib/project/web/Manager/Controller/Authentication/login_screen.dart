import 'package:get/get.dart';


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/Start.dart';
import 'AuthController.dart';
import '../../view/Home/HomePage.dart';
class LoginController extends GetxController {
  AuthController auth =Get.find();
  bool tap = false;
  var isLoading = false;
  String msg="";
  Map<String?, String?> authData = {
    'name': '',
    'password': '',
  };

  Future<void> submit(BuildContext context) async {
    msg="";
    isLoading = true;
    update();
    try {
      await auth.login(
        authData['password'],
        authData['name'],
      );
      Get.toNamed( HomePage.routeName);
    } on HttpException catch (error) {
      msg=error.message;
    } catch (error) {
      msg='Could not authenticate you. Please try again later.';
      print(error.toString());
      if(error.toString()=="No Connection")
        msg='No Connection';
    }
    isLoading = false;
    update();
  }


  void updateTap(bool t) {
    tap = t;
    update();
  }
}
