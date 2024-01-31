import 'package:get/get.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/BUS_Trucking/START_UP_LOCATION.dart';
import 'AuthController.dart';

class LoginController extends GetxController {
  AuthController auth =Get.find();
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
      Get.toNamed(Start_Up_Location.routeName);

    } on HttpException catch (error) {
      msg=error.message;
    } catch (error) {
      msg='Could not authenticate you. Please try again later.';
    }
    isLoading = false;
    update();
  }


}
