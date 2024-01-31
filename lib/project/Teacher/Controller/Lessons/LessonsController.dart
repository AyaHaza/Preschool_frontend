import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/size_config.dart';

import '../../Model/AllHomework.dart';
import '../../Model/AllLessons.dart';
import '../../Model/chat_user.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../Model/message.dart'as f;


import '../../view/LessonsMangement/AllLessons/AllLesson.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import '../Advertisement/apis.dart';
import '../HomeWork/HomeworkController.dart';
class LessonsController extends GetxController{


  Map<int ,AllLesson>allLessons ={};
 List<AllLesson>  SubjectLesson =[];



  String titleMsg="";
  String semesterMsg="";
  String numberMsg="";

  @override
  Future<void> onInit() async {
    super.onInit();
    await Fetch();
  }

  static var authEndpoint = "${AuthNetwork.baseUrl}/subject/lessons/${SizeConfig.id_Sub_Lesson}";
  static var FetchEndpoint = "${AuthNetwork.baseUrl}/subject/lessons";

  Future<void> Store(AllLesson allLesson) async {
    try {
       titleMsg="";
       semesterMsg="";
       numberMsg="";
      final responseData = await Network.Store(allLesson,"${AuthNetwork.baseUrl}/lesson");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

        if(responseData.containsKey('title')) {
          titleMsg = responseData['title'].toString();
        }
        if(responseData.containsKey('semester')) {
          semesterMsg = responseData['semester'].toString();
        }
        if(responseData.containsKey('number')) {
          numberMsg = responseData['number'].toString();
        }
        return;
      }
      AllLesson allLesson2=AllLesson.fromJson(responseData['data']);
      allLessons.addAll({allLesson2.id! : allLesson2 });
      update();
      Dialogs.Success("Added Successfully!");
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! < $e>");
    }
  }
 
 
  Future<void> Fetch() async {
    print("${AuthNetwork.baseUrl}/subject/lessons/${SizeConfig.id_Sub_Lesson}");
    try {
      final responseData = await Network.fetch("${AuthNetwork.baseUrl}/subject/lessons/${SizeConfig.id_Sub_Lesson}");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      allLessons.clear();
      responseData['data'].forEach((value) {
        AllLesson class1=AllLesson.fromJson(value);
        allLessons.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
  Future<void> Fetch1(int subid,int classid) async {
    try {
      final responseData = await Network.fetch("$FetchEndpoint/$subid/$classid");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      SubjectLesson.clear();
      responseData['data'].forEach((value) {
        AllLesson lesson=AllLesson.fromJson(value);
        SubjectLesson.add(lesson);
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
  Future<void> Edit(AllLesson EditedData,int classid) async {
      titleMsg="";
       semesterMsg="";
       numberMsg="";
      HomeworkController hwController =Get.put(HomeworkController());

      try {
      final responseData = await Network.Store(EditedData,"${AuthNetwork.baseUrl}/lesson/${EditedData.id}/$classid");
 if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

        if(responseData.containsKey('title')) {
          titleMsg = responseData['title'].toString();
        }
        if(responseData.containsKey('semester')) {
          semesterMsg = responseData['semester'].toString();
        }
        if(responseData.containsKey('number')) {
          numberMsg = responseData['number'].toString();
        }
        return;
      }
 
 if(EditedData.status!.compareTo("given")==0){
   List<AllHomework> hws=await hwController.Fetch1( EditedData.id!);

     send(EditedData.id!,hws, classid,EditedData.title!);
 }
      allLessons[EditedData.id]!.title=EditedData.title;
      allLessons[EditedData.id]!.semester=EditedData.semester;
      allLessons[EditedData.id]!.number=EditedData.number;
      allLessons[EditedData.id]!.status=EditedData.status;

      update();
      Dialogs.Success("Updated Successfully!");
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> Delete(int id) async {
    try {
      final responseData = await Network.Delete(id,"${AuthNetwork.baseUrl}/lesson");

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      allLessons.remove(id);
      update();
      Dialogs.Success(responseData['data']);

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }





  void send(int id, List<AllHomework>? lessonhws,int classid,String lesson_name) async {
    print(classid);
    DateTime dateTime =new DateTime.now();
    String all=" **** ${dateTime.day}/${dateTime.month} Homeworks for lesson $lesson_name ****'\n";
    lessonhws!.forEach((element) {
      String hw ="\n\n # page_number : ${element.page_number} '\n description :${element.description} '\n ";
      all+=hw;
    });
    ChatUser classc =APIs.list.where((element) => element.name.contains("Class $classid")==0||element.name.contains("class $classid")).first;
    await  APIs.sendMessage(classc,all, f.Type.text);
  }


  //
  // Future<void> SubjectClasses() async {
  //   print("${AuthNetwork.baseUrl}/subject/lessons/${SizeConfig.id_Sub_Lesson}");
  //   try {
  //     final responseData = await Network.fetch("${AuthNetwork.baseUrl}/subject/lessons/${SizeConfig.id_Sub_Lesson}");
  //     if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
  //       throw"error";
  //     }
  //     allLessons.clear();
  //     responseData['data'].forEach((value) {
  //       AllLesson class1=AllLesson.fromJson(value);
  //       allLessons.addAll({class1.id! : class1 });
  //     });
  //     update();
  //   }  catch (e) {
  //     print(e);
  //     Dialogs.Error("ERROR occure ! please Try Again! <$e>");
  //   }
  // }







}