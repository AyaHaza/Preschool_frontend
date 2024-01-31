import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/File.dart';

import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/Network.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
class FileController extends GetxController{

  static const fetchEndpoint = "${AuthNetwork.baseUrl}/teacher/templates";

  Map<int ,File>Files ={};

  @override
  void onInit() async {
    super.onInit();

  }

  Future<void> Fetch() async {
    try {
      final responseData = await Network.fetch(fetchEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      Files.clear();
      responseData['data'].forEach((value) {
        File temp=File.fromJson(value);
        Files.addAll({temp.id! :temp});
      });
      update();
      print(responseData['data']);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }


}