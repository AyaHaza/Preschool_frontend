

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/Subject.dart';
import '../../Model/Class.dart';
import '../../Model/Level.dart';
import 'SubjectController.dart';
class SubjectControllerScreen extends GetxController {
  SubjectController controller  =Get.find();

  var isLoading = false;
  String nameMsg="";
  String levelMsg="";
  Subject? Data =Subject() ;
  Subject? EditedData =Subject();

  Future<void> Store() async {
    nameMsg="";
    levelMsg="";
    isLoading = true;
    update();
    await controller.Store(Data!);
    nameMsg = controller.nameMsg;
    isLoading = false;
    update();
  }
  //
  Future<void> Edit(int id) async {
    nameMsg="";
    levelMsg="";
    isLoading = true;
    update();
    EditedData!.id=id;
    if( EditedData!.name!.compareTo(controller.Subjects[id]!.name!)!=0 )
    {
      await controller.Edit(EditedData!);
    }
    nameMsg = controller.nameMsg;
    isLoading = false;
    update();
  }

}
