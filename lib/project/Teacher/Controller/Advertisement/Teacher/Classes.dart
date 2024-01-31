import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Model/AbsentStudent.dart';
import '../../../Model/Class.dart';
import '../../../Model/Student.dart';
import '../../../Service/Authentication/AuthNetwork.dart';
import '../../../Service/Network.dart';
import '../../../widgets/Dialogs/ErrorDialog.dart';
import '../../Authentication/AuthController.dart';

class TeacherClassController extends GetxController{
  static AuthController auth =Get.find();

  static const authEndpoint = "${AuthNetwork.baseUrl}";
  Map<int,Class> Teacherclass ={};
  // Map<String,List<String>> teacherclassesStudent ={};
  Map<int,List<Student>> teacher_classes_students={};


  @override
  Future<void>  onInit() async {

    await Fetchteacherclasses();
    await FetchclassesStudents();
    super.onInit();
  }

  Future<void> Fetchteacherclasses() async {
    try {

      final responseData = await Network.fetch("$authEndpoint/teacher/class");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        Dialogs.Error("ERROR occure");
      }
      // teacherclassesStudent.clear();


      responseData['data'].forEach((value) {
        Class temp=Class.fromJson(value);
        print("class id");
        print(temp.id);
        Teacherclass.addAll({temp.id!:temp});
        // teacherclassesStudent.addAll({"${temp.id.toString()}":[]});

        teacher_classes_students.addAll({temp.id!:[]});
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> FetchclassesStudents() async {
    try {
      // teacherclassesStudent.forEach((key, value) async {
      //   final responseData = await Network.fetch("$authEndpoint/class/students/$key");
      //   if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
      //     Dialogs.Error("ERROR occure");
      //   }
      //   value.clear();
      //   teacher_classes_students[int.parse(key)]!.clear();
      //     responseData['data'].forEach((data) {
      //       Student temp = Student.fromJson(data);
      //       value.add("${temp.id.toString()}");
      //       teacher_classes_students[int.parse(key)]!.add(temp);
      //     });
      // });
      teacher_classes_students.forEach((key, value) async {
        final responseData = await Network.fetch("$authEndpoint/class/students/$key");
        if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
          Dialogs.Error("ERROR occure");
        }
        value.clear();
          responseData['data'].forEach((data) {
            Student temp = Student.fromJson(data);
            value.add(temp);
          });
      });
      update();

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
}