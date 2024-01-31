

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/School.dart';
import 'SchoolController.dart';
class SchoolControllerScreen extends GetxController {
  SchoolController controller  =Get.find();

  var isLoading = false;

  School? EditedData=School(name: "", phone: 0,BusTime: DateTime.now());

  String nameMsg="";
  String phoneMsg="";

  Future<void> Edit() async {
    nameMsg="";
    phoneMsg="";

    isLoading = true;
    update();
      await controller.Edit(EditedData!);

    nameMsg = controller.nameMsg;
    phoneMsg = controller.phoneMsg;

    isLoading = false;
    update();
  }

}
