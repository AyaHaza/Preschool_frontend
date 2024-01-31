import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/size_config.dart';

import '../../Model/AllHomework.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';


import '../../widgets/Dialogs/ErrorDialog.dart';
class HomeworkController extends GetxController{


  Map<int ,AllHomework>allHomeworks ={};
  String page_numberMsg="";
  String descriptionMsg="";

  @override
  Future<void> onInit() async {
    super.onInit();
    await Fetch();
  }

 // static var authEndpoint = "${AuthNetwork.baseUrl}/subject/lessons/${SizeConfig.id_Sub_Lesson}";

  Future<void> Store(AllHomework allHomework) async {
    try {
       page_numberMsg="";
       descriptionMsg="";
      final responseData = await Network.Store(allHomework,"${AuthNetwork.baseUrl}/homework");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

        if(responseData.containsKey('page_number')) {
          page_numberMsg = responseData['page_number'].toString();
        }
        if(responseData.containsKey('description')) {
          descriptionMsg = responseData['description'].toString();
        }
        return;
      }
      AllHomework allLesson2=AllHomework.fromJson(responseData['data']);
      allHomeworks.addAll({allLesson2.id! : allLesson2 });
      update();
      Dialogs.Success("Added Successfully!");
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! < $e>");
    }
  }
 
 
  Future<void> Fetch() async {
    if(SizeConfig.id_Lesson.isEmpty) {
      return;
    }
    print("${AuthNetwork.baseUrl}/lesson/homeworks/${SizeConfig.id_Lesson}");
    try {
      final responseData = await Network.fetch("${AuthNetwork.baseUrl}/lesson/homeworks/${SizeConfig.id_Lesson}");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      allHomeworks.clear();
      responseData['data'].forEach((value) {
        AllHomework class1=AllHomework.fromJson(value);
        allHomeworks.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
  Future<List<AllHomework>> Fetch1(int lessonid) async {
    try {
      final responseData = await Network.fetch("${AuthNetwork.baseUrl}/lesson/homeworks/$lessonid");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      List<AllHomework> hws=[];
      responseData['data'].forEach((value) {
        AllHomework hw=AllHomework.fromJson(value);
        hws.add(hw);
      });
      return hws;
    }  catch (e) {
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
      return [];
    }
  }
  Future<void> Edit(AllHomework EditedData) async {
  page_numberMsg="";
       descriptionMsg="";
    try {
      final responseData = await Network.Edit(EditedData,"${AuthNetwork.baseUrl}/homework");
  if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

        if(responseData.containsKey('page_number')) {
          page_numberMsg = responseData['page_number'].toString();
        }
        if(responseData.containsKey('description')) {
          descriptionMsg = responseData['description'].toString();
        }
        return;
      }
      allHomeworks[EditedData.id]!.page_number=EditedData.page_number;
      allHomeworks[EditedData.id]!.description=EditedData.description;

      update();
      Dialogs.Success("Updated Successfully!");
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> Delete(int id) async {
    try {
      final responseData = await Network.Delete(id,"${AuthNetwork.baseUrl}/homework");

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      allHomeworks.remove(id);
      update();
      Dialogs.Success(responseData['data']);

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }

}