import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Model/SubjectClasses.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/Network.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
  class SubClassesController extends GetxController{

  static const fetchEndpoint = "${AuthNetwork.baseUrl}/teacher/subjects/classes";
  Map<int ,List<SubjectClass>> SubjectClasses ={};

  @override
  void onInit() async {
    await Fetch();
    super.onInit();

  }

  Future<void> Fetch() async {
    try {
      final responseData = await Network.fetch(fetchEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      SubjectClasses.clear();
      responseData['data'].forEach((value) {
        SubjectClass temp=SubjectClass.fromJson(value);

       if( SubjectClasses.containsKey(temp.subjectId)) {
         SubjectClasses[temp.subjectId]!.add(temp) ;
       } else{SubjectClasses.addAll({temp.subjectId! :[temp]});}

      });
      print("Dddddddddddddddddddddddddddd");
      update();
      print(responseData['data']);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }

}