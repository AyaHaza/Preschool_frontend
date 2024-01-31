import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/AbsentCheck.dart';
import '../../Model/AbsentStudent.dart';
import '../../Model/Model.dart';
import '../../Model/Student.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';

import '../../view/Teacher_view/Attendance/ALLStudents.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import '../Advertisement/Teacher/Classes.dart';
class AttendanceController extends GetxController{
  TeacherClassController controller1= Get.find();

  List<AbsentStudent> AbsentStudents =[];
  ////fetch its value
  ////update its value every post
  Map<int,List<AbsentStudent>> TodayClassAbsentStudents ={};

  static const authEndpoint = "${AuthNetwork.baseUrl}/abs";


@override
Future<void>  onInit() async {
   await TodayClassAbsentinitiate();
   super.onInit();

}
  Future<void> TodayClassAbsentinitiate() async{
  controller1.teacher_classes_students.forEach((key, value) async {
  TodayClassAbsentStudents.addAll({key:[]});
   Fetch(null, key);
  });
}

  /////// store edit today


  Future<void> Store(List<AbsentStudent> absents,int key) async {
    try {
      AbsentStudentList model =AbsentStudentList(Absents: absents);

      final responseData = await Network.Store(model,authEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        return;
      }
      await Fetch(null,key);
      print(TodayClassAbsentStudents);
      print(TodayClassAbsentStudents![Key]);
      update();
      Dialogs.Success("Done!");
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! < $e>");
    }
  }
  Future<void> Fetch(DateTime? date,int? class_id) async {
    try {
      var y=false;
      if(date==null){ y=true;
      print("date====null");

      }
      date ??= DateTime.now();
      print("Dddddddddddddddddddddddddddddddd");
      print(date.toIso8601String());
      var datevar= "date=${date.year}/${date.month}/${date.day}";
      var classid ="&class_id=$class_id" ?? "";

      final responseData = await Network.fetch("$authEndpoint?$datevar$classid");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      AbsentStudents.clear();
      responseData['data'].forEach((value) {
        AbsentStudent student=AbsentStudent.fromJson(value);
        AbsentStudents.add(student);
      });
      if(y==true)
      {
        TodayClassAbsentStudents[class_id]!.clear();
        responseData['data'].forEach((value) {
          AbsentStudent student=AbsentStudent.fromJson(value);
          print("absentttttttttttttttttttttttttttttttttt  ${student.id}");
          TodayClassAbsentStudents[class_id]!.add(student);
        });
      }
      update();

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
  // Future<void> Edit(Class EditedData) async {
  //   nameMsg="";
  //   CapacityMsg="";
  //   level_idMsg="";
  //   try {
  //     final responseData = await Network.Edit(EditedData,authEndpoint);
  //
  //     if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
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
  //     Classes[EditedData.id]!.name=EditedData.name;
  //     Classes[EditedData.id]!.capacity=EditedData.capacity;
  //     Classes[EditedData.id]!.levelId=EditedData.levelId;
  //
  //     update();
  //     Dialogs.SuccessEdit("Updated Successfully!",ClassManagemet.routeName);
  //   }  catch (e) {
  //     print(e);
  //     Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
  //   }
  // }
  // Future<void> Delete(int id) async {
  //   try {
  //     final responseData = await Network.Delete(id,authEndpoint);
  //
  //     if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
  //       throw"error";
  //     }
  //     Classes.remove(id);
  //     update();
  //     Dialogs.Success(responseData['message']);
  //
  //   }  catch (e) {
  //     print(e);
  //     Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
  //   }
  // }

}