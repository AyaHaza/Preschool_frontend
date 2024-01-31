

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/Class.dart';
import '../../Model/Level.dart';
import 'classController.dart';
class ClassControllerScreen extends GetxController {
  ClassController controller  =Get.find();

  var isLoading = false;
  String nameMsg="";
  String CapacityMsg="";
  String level_idMsg="";

  Class? Data =Class() ;
  Class? EditedData =Class();

  Future<void> Store() async {
     nameMsg="";
     CapacityMsg="";
     level_idMsg="";
    isLoading = true;
    update();
    await controller.Store(Data!);
    nameMsg = controller.nameMsg;
    CapacityMsg = controller.CapacityMsg;
    level_idMsg = controller.level_idMsg;
    isLoading = false;
    update();
  }
  //
  Future<void> Edit(int id) async {
    nameMsg="";
    CapacityMsg="";
    level_idMsg="";
    isLoading = true;
    EditedData!.id=id;
    update();
    if(EditedData!.levelId==null)
      EditedData!.levelId=controller.Classes[id]!.levelId!;
    if( EditedData!.name!.compareTo(controller.Classes[id]!.name!)!=0 ||
        EditedData!.capacity!.compareTo(controller.Classes[id]!.capacity!)!=0
    || EditedData!.levelId!.compareTo(controller.Classes[id]!.levelId!)!=0
    ){
      await controller.Edit(EditedData!);
    }
    nameMsg = controller.nameMsg;
    CapacityMsg = controller.CapacityMsg;
    level_idMsg = controller.level_idMsg;
    isLoading = false;
    update();
  }

}
