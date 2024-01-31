

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/Class.dart';
import '../../Model/Level.dart';
import '../../Model/StudentFee.dart';
import '../../view/StudentsFees/studentFee/view.dart';
import 'FeeController.dart';
class FeeControllerScreen extends GetxController {
  FeeController controller  =Get.find();

  var isLoading = false;

  String amount="";
  String student_id="";

  Fee? Data =Fee() ;

  Future<void> Store() async {
    String amount="";
    String student_id="";
    isLoading = true;
    update();
    await controller.Store(Data!);
    amount = controller.amount;
    student_id = controller.student_id;
    isLoading = false;
    update();
  }
  Future<void> StudentFee(int id) async {
    isLoading = true;
    update();
    await controller.FetchStudentFee(id);
    Get.toNamed( FeeStudentview.routeName,arguments: [id]);
    isLoading = false;
    update();
  }
  //


}
