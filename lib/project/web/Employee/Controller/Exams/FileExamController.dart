import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Model/Exam.dart';
import '../../Model/File.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../view/Subject/SubjectPage.dart';
import '../../Service/Network.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import '../../Model/Subject.dart';
class FileExamController extends GetxController{

  static const fetchEndpoint = "${AuthNetwork.baseUrl}/day/exams";
  Map<int ,Exam>Files ={};

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
      Files.clear();
      responseData['data'].forEach((value) {
        Exam temp=Exam.fromJson(value);
        print(temp.id);
        Files.addAll({temp.id! :temp});
      });
      print("Dddddddddddddddddddddddddddd");
      update();
      print(responseData['data']);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  void open(i){

    launchInBrowser(Uri.parse(Files.values.elementAt(i)!.filePath!));

  }
  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}