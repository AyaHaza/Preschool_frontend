import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/File.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../view/Subject/SubjectPage.dart';
import '../../Service/Network.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import '../../Model/Subject.dart';
class FileController extends GetxController{

  static const authEndpoint = "${AuthNetwork.baseUrl}/template";
  static const fetchEndpoint = "${AuthNetwork.baseUrl}/manager/templates";
  static const updateEndpoint = "${AuthNetwork.baseUrl}/template/updateStatus";
  static const DeleteEndpoint = "${AuthNetwork.baseUrl}/template/delete";

  Map<int ,File>Files ={};

  @override
  void onInit() async {
    // await Fetch();
    super.onInit();

  }

  Future<void> Store(File file) async {
    try {
      final responseData = await Network.Store(file,"$authEndpoint/store");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {

        if(responseData.containsKey('name')) {
          // nameMsg = responseData['name'].toString();
        }
        return;
      }
      print("Ddddddddddddddddddd");
      File temp=File.fromJson(responseData['data']);
      Files.addAll({temp.id! :temp});
      update();
      Get.back();
      Dialogs.Success("Added Successfully!");
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> Fetch() async {
    try {
      final responseData = await Network.fetch(fetchEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      Files.clear();
      responseData['data'].forEach((value) {
        File temp=File.fromJson(value);
        Files.addAll({temp.id! :temp});
      });
      update();
      print(responseData['data']);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> UpdateStatus(int id) async {
    ///did
    try {
      String Status;
      id=Files.values.elementAt(id).id!;
      if(Files[id]!.status!.compareTo("available")==0) {
        Status="unavailable";
      } else {
        Status="available";
      }
      final responseData = await Network.Edit_Status("$updateEndpoint/$id ?status= $Status");

      Files[id]!.status=Status;
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> Delete(int id) async {
    try {
      id=Files.values.elementAt(id).id!;
      final responseData = await Network.Delete(id,DeleteEndpoint);
      print("fff");
      Files.remove(id);
      print("Dss");
      update();
      Dialogs.Success(responseData['data']);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
}