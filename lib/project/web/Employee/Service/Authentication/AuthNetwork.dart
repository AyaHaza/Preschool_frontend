import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../view/Home/HomePage.dart';
import '../NetWork.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';
import '../../Model/User.dart';
class AuthNetwork {
  static final Dio dio = Dio();
  static const base = "http://192.168.43.178/";
  static const baseUrl = "http://192.168.43.178/api";
  static const authEndpoint = "$baseUrl/login";
  static const authEndpointLogout = "$baseUrl/logout";
  static final Connectivity _connectivity = Connectivity();

//
//   static Future<void> prepareJar() async {
//     var picked = await FilePicker.platform.pickFiles();
//
//     if (picked != null) {
//       print(picked.files.first.name);
//       var fileBytes = picked.files.first.bytes;
//         print(picked.files.first.path);
//       // final Directory appDocDir = result.files.first.path;
//       final String? appDocPath = picked.files.first.path;
//       final jar = PersistCookieJar(
//         ignoreExpires: true,
//         storage: FileStorage(appDocPath! + "/.cookies/"),
//       );
//       dio.interceptors.add(CookieManager(jar));
//     }
//   }
//
// static Future<void> checkLogin()async{
//   try {
//   var response=await dio.get(baseUrl);
//   if(response.statusCode ==200)
//     {
//       Get.toNamed(HomePage.routeName);
//     }
//   } on DioError catch (e) {
//     print(e);
//   }
// }

 static Future<Map<String, dynamic>> Login(String? password, String? name) async {

   await Network.initConnectivity();
   if (Network.connectionStatus != ConnectivityResult.none) {
     final response = await dio.post(
       authEndpoint,
       data: jsonEncode(<String, String>{
         'name': '$name',
         'password': '$password',
       }),
     );
     return response.data;
   }
   throw "Error Connection ! No Internet";
  }

  static Future<void> StoreData(String token, int userid) async {

    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode(
      {
        'token': token,
        'userId': userid,
      },
    );
    prefs.setString('userData', userData);
  }

  static Future<MapEntry?> getData() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) return null;
    final extractedUserData =
        json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    var token = extractedUserData['token'].toString();
    var userid = int.parse(extractedUserData['userId'].toString());
    return MapEntry(userid, token);
  }

  static Future<void> logout(String? token) async {
    await Network.initConnectivity();
    if (Network.connectionStatus != ConnectivityResult.none) {
      final response = await dio.post(
          authEndpoint,
          options: Options(
            validateStatus: (_) =>true,
            contentType: Headers.jsonContentType,
            responseType:ResponseType.json,
            headers: {
              "Authorization":  "Bearer $token"
            },
          )
      );
      deleteData();
    }
    throw "Error Connection ! No Internet";
  }
  static Future<void> deleteData() async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('userData')) {
      prefs.remove('userData');
      prefs.clear();
    }
  }

}
