import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/School.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../view/Subject/SubjectPage.dart';
import '../../Service/Network.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
class SchoolController extends GetxController{

  static const authEndpoint = "${AuthNetwork.baseUrl}/school";

  School? school ;
  String nameMsg="";
  String phoneMsg="";

  @override
  Future<void>  onInit() async {
    school=School(name: "", phone: 0,BusTime: DateTime.now() );
    await Fetch();
    super.onInit();

  }

  Future<void> Fetch() async {
    try {
      print("school Fetch");

      final responseData = await Network.fetch("$authEndpoint/1");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
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
  Future<void> Edit(School EditedData) async {
     nameMsg="";
     phoneMsg="";
    try {
      final responseData = await Network.Store(EditedData,"$authEndpoint/1");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        if(responseData.containsKey('name')) {
          nameMsg = responseData['name'].toString();
        }
        if(responseData.containsKey('phone')) {
          phoneMsg = responseData['phone'].toString();
        }
        return;
      }
      school!.name=EditedData.name;
      school!.phone=EditedData.phone;
      school!.BusTime=EditedData.BusTime;

      update();
      Dialogs.SuccessEdit("Updated Successfully!",null);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }


}