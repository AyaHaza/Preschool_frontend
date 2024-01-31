import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../view/Subject/SubjectPage.dart';
import '../../Service/NetWork.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import '../../Model/Subject.dart';
class SubjectController extends GetxController{

  static const authEndpoint = "${AuthNetwork.baseUrl}/subject";

  Map<int ,Subject>Subjects ={};
  String nameMsg="";

  @override
  void onInit() async {
    await Fetch();
    super.onInit();

  }

  Future<void> Store(Subject subject1) async {
    try {
      nameMsg="";
      final responseData = await Network.Store(subject1,authEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

        if(responseData.containsKey('name')) {
          nameMsg = responseData['name'].toString();
        }
        return;
      }
      Subject subject=Subject.fromJson(responseData['data']);
      Subjects.addAll({subject.id! :subject});
      update();
      Dialogs.Success("Added Successfully!");
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> Fetch() async {
    try {
      print("Subject Fetch");

      final responseData = await Network.fetch(authEndpoint);
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
  Future<void> Edit(Subject EditedData) async {
    nameMsg="";

    try {
      final responseData = await Network.Store(EditedData,"$authEndpoint/${EditedData.id}");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        if(responseData.containsKey('name')) {
          nameMsg = responseData['name'].toString();
        }
        return;
      }
      Subjects[EditedData.id]?.name=EditedData.name;
      Subjects[EditedData.id]?.level_id=EditedData.level_id;
      update();
      Dialogs.SuccessEdit("Updated Successfully!",SubjectManagemet.routeName);
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
      Subjects.remove(id);
      update();
      Dialogs.Success(responseData['message']);

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }

}