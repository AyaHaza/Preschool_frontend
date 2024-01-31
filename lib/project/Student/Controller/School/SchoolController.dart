import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/School.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
class SchoolController extends GetxController{

  static const authEndpoint = "${AuthNetwork.baseUrl}/school";

  School? school ;

  @override
  Future<void>  onInit() async {
    school=School(name: "", phone: 0,BusTime: DateTime.now() );
    await Fetch();
    super.onInit();
  }

  Future<void> Fetch() async {
    try {
      final responseData = await Network.fetch("$authEndpoint/1");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        Dialogs.Error("ERROR occure");
      }
      School temp=School.fromJson(responseData['data']);
      school!.name=temp.name;
      school!.phone=temp.phone;
      school!.location=temp.location;
      school!.BusTime=temp.BusTime;
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
}