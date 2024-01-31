import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/Configs/ConfigPage.dart';
import '../../Model/Config.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../Model/FeeyearConfig.dart';

import '../../view/Configs/FeeConfig/Show/FeeShow.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
class FeeConfigController extends GetxController{
  static const authEndpoint = "${AuthNetwork.baseUrl}/yearFees";


  Map<int ,FeeYear> FeeConfigs ={};
  String? Year="";
  String? study_fees="";
  String? bus_fees="";
  String? discount_bus="";
  String? discount_without_bus="";



  Future<void> Store(FeeYear fee) async {
    try {
      Year="";
      study_fees="";
      bus_fees="";
      discount_bus="";
      discount_without_bus="";
      final responseData = await Network.Store(fee,authEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

        if(responseData.containsKey('year')) {
          Year = responseData['year'].toString();
        }
        if(responseData.containsKey('study_fees')) {
          study_fees = responseData['study_fees'].toString();
        }
        if(responseData.containsKey('bus_fees')) {
          bus_fees = responseData['bus_fees'].toString();
        }
        if(responseData.containsKey('discount_bus')) {
          discount_bus = responseData['discount_bus'].toString();
        }
        if(responseData.containsKey('discount_without_bus')) {
          discount_without_bus = responseData['discount_without_bus'].toString();
        }
        update();

        return;
      }

      FeeYear feeconfig=FeeYear.fromJson(responseData['data']);
      FeeConfigs.addAll({feeconfig.id! : feeconfig });
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
      FeeConfigs.clear();
      responseData['data'].forEach((value) {
        FeeYear feeconfig=FeeYear.fromJson(value);
        FeeConfigs.addAll({feeconfig.id! : feeconfig });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> Edit(FeeYear fee) async {
    Year="";
    study_fees="";
    bus_fees="";
    discount_bus="";
    discount_without_bus="";
    try {
      final responseData = await Network.Edit(fee,authEndpoint);

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

        if(responseData.containsKey('year')) {
          Year = responseData['year'].toString();
        }
        if(responseData.containsKey('study_fees')) {
          study_fees = responseData['study_fees'].toString();
        }
        if(responseData.containsKey('bus_fees')) {
          bus_fees = responseData['bus_fees'].toString();
        }
        if(responseData.containsKey('discount_bus')) {
          discount_bus = responseData['discount_bus'].toString();
        }
        if(responseData.containsKey('discount_without_bus')) {
          discount_without_bus = responseData['discount_without_bus'].toString();
        }
        update();
        return;
      }
      FeeConfigs[fee.id]!.year=fee.year;
      FeeConfigs[fee.id]!.busFees=fee.busFees;
      FeeConfigs[fee.id]!.discountBus=fee.discountBus;
      FeeConfigs[fee.id]!.studyFees=fee.studyFees;
      FeeConfigs[fee.id]!.discountWithoutBus=fee.discountWithoutBus;

      update();
      Dialogs.SuccessEdit("Updated Successfully!",YearFeeConfigShow.routeName);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> Delete(int id) async {
    try {
      final responseData = await Network.Delete(id,authEndpoint);

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

        if(responseData.containsKey('Year')) {
          Year = responseData['Year'].toString();
        }
        if(responseData.containsKey('study_fees')) {
          study_fees = responseData['study_fees'].toString();
        }
        if(responseData.containsKey('bus_fees')) {
          bus_fees = responseData['bus_fees'].toString();
        }
        if(responseData.containsKey('discount_bus')) {
          discount_bus = responseData['discount_bus'].toString();
        }
        if(responseData.containsKey('discount_without_bus')) {
          discount_without_bus = responseData['discount_without_bus'].toString();
        }
        update();
        return;
      }
      FeeConfigs.remove(id);
      update();
      Dialogs.Success(responseData['message']);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }

}