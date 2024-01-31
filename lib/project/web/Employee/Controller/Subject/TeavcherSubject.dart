import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../CONSTANT/size_config.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import '../../Model/Subject.dart';
class TeacherSubjectController extends GetxController{

  //static const authEndpoint = "${AuthNetwork.baseUrl}/teacher/subject/in/class/";

  Map<int ,Subject>Subjects ={};
  String nameMsg="";
  String levelMsg="";

  @override
  void onInit() async {
    super.onInit();
    await Fetch();
  }

  Future<void> Fetch() async {
    try {
      print(SizeConfig.id_Teacher);
      final responseData = await Network.fetch("${AuthNetwork.baseUrl}/teacher/subject/in/class/${SizeConfig.id_ClassSub}/${SizeConfig.id_Teacher}");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      Subjects.clear();
      responseData['data'].forEach((value) {
        Subject subject=Subject.fromJson(value);
        Subjects.addAll({subject.id! :subject});
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }


  Future<void> Delete(int id) async {
    try {
      final responseData = await Network.Delete(id,"${AuthNetwork.baseUrl}/teacher/subject/in/class/${SizeConfig.id_ClassSub}/${SizeConfig.id_Teacher}");

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      Subjects.remove(id);
      update();
      Dialogs.Success(responseData['data']);

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
}