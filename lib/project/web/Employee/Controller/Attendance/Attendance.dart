import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/AbsentStudent.dart';
import '../../Model/Student.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';

import '../../view/Attendance/ALLStudents.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
class AttendanceController extends GetxController{

  List<AbsentStudent> AbsentStudents =[];

  static const authEndpoint = "${AuthNetwork.baseUrl}/abs";

  // Future<void> Store(Class class1) async {
  //   try {
  //     nameMsg="";
  //     CapacityMsg="";
  //     level_idMsg="";
  //     final responseData = await Network.Store(class1,authEndpoint);
  //     if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
  //
  //       if(responseData.containsKey('name')) {
  //         nameMsg = responseData['name'].toString();
  //       }
  //       if(responseData.containsKey('capacity')) {
  //         CapacityMsg = responseData['capacity'].toString();
  //       }
  //       if(responseData.containsKey('level_id')) {
  //         level_idMsg = responseData['level_id'].toString();
  //       }
  //       return;
  //     }
  //     Class class2=Class.fromJson(responseData['data']);
  //     Classes.addAll({class2.id! : class2 });
  //     update();
  //     Dialogs.Success("Added Successfully!");
  //   }  catch (e) {
  //     print(e);
  //     Dialogs.Error("ERROR occure ! please Try Again! < $e>");
  //   }
  // }
  Future<void> Fetch(DateTime? date,int? class_id) async {
    try {
      date ??= DateTime.now();
      var datevar= "date=${date.year}/${date.month}/${date.day}";
      var classid ="&class_id=$class_id" ?? "";
print("$authEndpoint?$datevar$classid");
      final responseData = await Network.fetch("$authEndpoint?$datevar$classid");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      print("mmmmmmmmmmmmmmmmmm");
      AbsentStudents.clear();
      responseData['data'].forEach((value) {
        AbsentStudent student=AbsentStudent.fromJson(value);
        AbsentStudents.add(student);
      });
      update();
      Get.toNamed(ALLStudents.routeName);

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
    Future<void> Update(AbsentStudent EditedData) async {
    print(EditedData.toJson());
    try {
      final responseData = await Network.Edit(EditedData,authEndpoint);

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw "Cannot update this";
      }
      AbsentStudents.where((element) => element.id!.compareTo(EditedData.id!)==0).first.justification=EditedData.justification;
      update();
      Dialogs.SuccessEdit("Updated Successfully!",null);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> Delete(int id) async {
    try {

      final responseData = await Network.Delete(id,authEndpoint);

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"Cannot Delete this";
      }
      AbsentStudents.removeWhere((element) => element.id!.compareTo(id)==0);
      update();
      Get.back();
      Dialogs.Success("Deleted Successfully!");

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }

}