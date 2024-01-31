

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/Config.dart';
import '../../Model/FeeyearConfig.dart';
import 'ConfigController.dart';
class ConfigControllerScreen extends GetxController {
  ConfigController controller  =Get.find();


  var isLoading = false;
  String DateMsg="";
  String AmountMsg="";
  Config? Data =Config() ;
  Config? EditedData =Config();



  Future<void> Store() async {
    DateMsg="";
    AmountMsg="";
    isLoading = true;
    update();
    await controller.Store(Data!);
    DateMsg = controller.DateMsg;
    AmountMsg = controller.AmountMsg;

    isLoading = false;
    update();
  }
  //
  Future<void> Edit(int id) async {
    DateMsg="";
    AmountMsg="";
    isLoading = true;
    EditedData!.id=id;
    update();
    if( EditedData!.amount!.compareTo(controller.Configs[id]!.amount!)!=0
    || EditedData!.date!=null && EditedData!.date!.compareTo(controller.Configs[id]!.date!)!=0
    ){
      EditedData!.date=controller.Configs[id]!.date!;
      await controller.Edit(EditedData!);
    }
    DateMsg = controller.DateMsg;
    AmountMsg = controller.AmountMsg;
    isLoading = false;
    update();
  }

}
