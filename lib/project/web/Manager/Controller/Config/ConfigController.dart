import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/Configs/ConfigPage.dart';
import '../../Model/Config.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';

import '../../widgets/Dialogs/ErrorDialog.dart';
class ConfigController extends GetxController{


  Map<int ,Config>Configs ={};
  String DateMsg="";
  String AmountMsg="";
  static const authEndpoint = "${AuthNetwork.baseUrl}/config";


  @override
  void onInit() async {
    await Fetch();
    super.onInit();

  }


  Future<void> Store(Config config1) async {
    try {
      DateMsg="";
      AmountMsg="";
      final responseData = await Network.Store(config1,authEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

        if(responseData.containsKey('date')) {
          DateMsg = responseData['date'].toString();
        }
        if(responseData.containsKey('amount')) {
          AmountMsg = responseData['amount'].toString();
        }
        update();
        return;
      }

      Config config=Config.fromJson(responseData['data']);
      Configs.addAll({config.id! : config });
      update();
      Dialogs.Success("Added Successfully!");
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> Fetch() async {
    try {
      final responseData = await Network.fetch(authEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      Configs.clear();
      responseData['data'].forEach((value) {
        Config config=Config.fromJson(value);
        Configs.addAll({config.id! : config });
      });
      print(responseData);
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> Edit(Config EditedData) async {
    DateMsg="";
    AmountMsg="";
    try {
      final responseData = await Network.Edit(EditedData,authEndpoint);

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        if(responseData.containsKey('date')) {
          DateMsg = responseData['date'].toString();
        }
        if(responseData.containsKey('amount')) {
          AmountMsg = responseData['amount'].toString();
        }
        return;
      }
      Configs[EditedData.id]!.date=EditedData.date;
      Configs[EditedData.id]!.amount=EditedData.amount;

      update();
      Dialogs.SuccessEdit("Updated Successfully!",ConfigManagemet.routeName);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> Delete(int id) async {
    try {
      final responseData = await Network.Delete(id,authEndpoint);

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      Configs.remove(id);
      update();
      Dialogs.Success(responseData['message']);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }

}