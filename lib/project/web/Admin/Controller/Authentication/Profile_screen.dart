

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/User.dart';
import 'AuthController.dart';
class ProfileControllerScreen extends GetxController {
  AuthController controller  =Get.find();

  var isLoading = false;
  String nameMsg="";
  String photoMsg="";
  String PasswordMsg="";
  String CurrentPasswordMsg="";

  User? EditedData =User();



  Future<void> Edit() async {
     nameMsg="";
     photoMsg="";
     PasswordMsg="";
     CurrentPasswordMsg="";

    isLoading = true;
    update();
    EditedData!.id=controller.user!.id;


    await controller.Edit(EditedData!);


     nameMsg=controller.nameMsg;
     PasswordMsg=controller.PasswordMsg;
     CurrentPasswordMsg=controller.CurrentPasswordMsg;
     photoMsg=controller.photoMsg;
     isLoading = false;
    update();
  }
}
