import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';

import '../../Model/Class.dart';
import '../../Model/Level.dart';
import '../../view/Classes/ClassPage.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import '../Advertisement/Management/apis.dart';
class ClassController extends GetxController{


  Map<int ,Class>Classes ={};
  String nameMsg="";
  String CapacityMsg="";
  String level_idMsg="";

  @override
  Future<void> onInit() async {
    await Fetch();

    super.onInit();
  }

  static const authEndpoint = "${AuthNetwork.baseUrl}/classes";

  Future<void> Store(Class class1) async {
    try {
       nameMsg="";
       CapacityMsg="";
       level_idMsg="";
      final responseData = await Network.Store(class1,authEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

        if(responseData.containsKey('name')) {
          nameMsg = responseData['name'].toString();
        }
        if(responseData.containsKey('capacity')) {
          CapacityMsg = responseData['capacity'].toString();
        }
        if(responseData.containsKey('level_id')) {
          level_idMsg = responseData['level_id'].toString();
        }
        return;
      }
      Class class2=Class.fromJson(responseData['data']);
      Classes.addAll({class2.id! : class2 });
      update();
      APIs.StoreClass(class2.id!, class2.name!);
      Dialogs.Success("Added Successfully!");
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! < $e>");
    }
  }
  Future<void> Fetch() async {
    try {
      final responseData = await Network.fetch(authEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      Classes.clear();
      responseData['data'].forEach((value) {
        Class class1=Class.fromJson(value);
        Classes.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
  Future<void> Edit(Class EditedData) async {
    nameMsg="";
    CapacityMsg="";
    level_idMsg="";
    try {
      final responseData = await Network.Edit(EditedData,authEndpoint);

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        if(responseData.containsKey('name')) {
          nameMsg = responseData['name'].toString();
        }
        if(responseData.containsKey('capacity')) {
          CapacityMsg = responseData['capacity'].toString();
        }
        if(responseData.containsKey('level_id')) {
          level_idMsg = responseData['level_id'].toString();
        }
        return;
      }
      Classes[EditedData.id]!.name=EditedData.name;
      Classes[EditedData.id]!.capacity=EditedData.capacity;
      Classes[EditedData.id]!.levelId=EditedData.levelId;

      update();
      Dialogs.SuccessEdit("Updated Successfully!",ClassManagemet.routeName);
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
      Classes.remove(id);
      update();
      APIs.DeleteClass(id);
      Dialogs.Success(responseData['message']);

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }

}