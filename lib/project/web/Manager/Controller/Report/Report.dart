import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Model/Report.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/Network.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
class ReportController extends GetxController{

  static const monthEndpoint = "${AuthNetwork.baseUrl}/report/monthlyFeesReport";
  static const yearEndpoint = "${AuthNetwork.baseUrl}/report/yearlyFeesReport";
  static const allEndpoint = "${AuthNetwork.baseUrl}/report";

  Map<int ,Report>MFiles ={};
  Map<int ,Report>YFiles ={};
  Map<int ,Report>AFiles ={};

  Map<int ,Report>ReportA ={};


  @override
  void onInit() async {
     await MFetch();
     await YFetch();
     await AFetch();
     super.onInit();

  }
  void set(Map<int ,Report> report)async{
    ReportA=report;
    update();
  }
  Future<void> MFetch() async {
    try {
      final responseData = await Network.fetch(monthEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      MFiles.clear();
      responseData['data'].forEach((value) {
        Report temp=Report.fromJson(value);
        MFiles.addAll({temp.id! :temp});
      });
      update();
      print(responseData['data']);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> YFetch() async {
    try {
      final responseData = await Network.fetch(yearEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      YFiles.clear();
      responseData['data'].forEach((value) {
        Report temp=Report.fromJson(value);
        YFiles.addAll({temp.id! :temp});
      });
      update();
      print(responseData['data']);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> AFetch() async {
    try {
      final responseData = await Network.fetch(allEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      AFiles.clear();
      responseData['data'].forEach((value) {
        Report temp=Report.fromJson(value);
        AFiles.addAll({temp.id! :temp});
      });
      update();
      print(responseData['data']);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  void open(i){

    launchInBrowser(Uri.parse( "${AuthNetwork.base}/${ReportA.values.elementAt(i)!.url!}"));
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