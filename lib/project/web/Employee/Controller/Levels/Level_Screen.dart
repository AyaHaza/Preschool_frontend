

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/Level.dart';
import 'LevelController.dart';
class LevelControllerScreen extends GetxController {
  LevelController controller  =Get.find();

  var isLoading = false;
  String nameMsg="";
  String ageMsg="";


  Level? Data =Level() ;
  Level? EditedData =Level();

  Future<void> Store() async {
     nameMsg="";
     ageMsg="";
    isLoading = true;
    update();
      await controller.Store(Data!);
      nameMsg = controller.nameMsg;
      ageMsg = controller.ageMsg;
    isLoading = false;
    update();
  }
  Future<void> Edit(int id) async {
    nameMsg = "";
    ageMsg = "";
    isLoading = true;
    EditedData!.id=id;
    update();
    if( EditedData!.name!.compareTo(controller.levels[id]!.name!)!=0 ||
        EditedData!.age!.toString().compareTo(controller.levels[id]!.age.toString())!=0
    ){
      await controller.Edit(EditedData!);
    }
    nameMsg = controller.nameMsg;
    ageMsg = controller.ageMsg;
    isLoading = false;
    update();
  }

}
