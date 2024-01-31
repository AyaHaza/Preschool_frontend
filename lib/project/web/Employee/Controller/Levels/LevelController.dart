import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';

import '../../Model/Level.dart';
import '../../view/Levels/LevelPage.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
class LevelController extends GetxController{


  Map<int ,Level>levels ={};
  String nameMsg='';
  String ageMsg='';
  static const Endpoint = "${AuthNetwork.baseUrl}/levels";


  @override
  void onInit() async {
   await Fetch();
   super.onInit();

  }

  Future<void> Store(Level level1) async {
    try {
       nameMsg='';
       ageMsg='';
      final responseData = await Network.Store(level1,Endpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        if(responseData.containsKey('name')) {
          nameMsg = responseData['name'].toString();
        }
        if(responseData.containsKey('age')) {
          ageMsg = responseData['age'].toString();
        }
        return;
       }
      Level level=Level.fromJson(responseData['data']);
      levels.addAll({level.id! : level });
      update();
      Dialogs.Success("Added Successfully!");
    }  catch (e) {
      print(e);
     Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> Fetch() async {
    try {
      print("level Fetch");

      final responseData = await Network.fetch(Endpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      levels.clear();
      responseData['data'].forEach((value) {
        Level level=Level.fromJson(value);
        levels.addAll({level.id! : level });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> Edit(Level level) async {
    nameMsg='';
    ageMsg='';
    try {
      final responseData = await Network.Edit(level,Endpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        if(responseData.containsKey('name')) {
          nameMsg = responseData['name'].toString();
        }
        if(responseData.containsKey('age')) {
          ageMsg = responseData['age'].toString();
        }
        return;
      }
      levels[level.id]?.name=level.name;
      levels[level.id]?.age=level.age;
      update();
      Dialogs.SuccessEdit("Updated Successfully!",LevelManagemet.routeName);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
 Future<void> Delete(int id) async {
   try {
     final responseData = await Network.Delete(id,Endpoint);

     if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
       throw"error";
     }
     levels.remove(id);
     update();
     Dialogs.Success(responseData['message']);

   }  catch (e) {
     print(e);
     Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
   }
 }

}