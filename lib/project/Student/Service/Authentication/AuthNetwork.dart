import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controller/Authentication/services.dart';
class AuthNetwork {
  static final Dio dio = Dio();
  static const base = "http://192.168.43.178";
  static const baseUrl = "http://192.168.43.178/api";
  static const authEndpoint = "$baseUrl/login";
  static const authEndpointLogout = "$baseUrl/logout";
  static MyServices myServices= Get.find();

  static Future<Map<String, dynamic>> Login(String? password, String? name) async {

    final response = await dio.post(
      authEndpoint,
      data: jsonEncode(<String, String>{
        'name': '$name',
        'password': '$password',
      }),
    );
    print("ffffffffffffffffffffffffffffffffffffffffffffffff");
    print(response.data);
    return response.data;
  }

  static Future<void> StoreData(String token, int userid) async {
    final prefs = myServices.sharedPreferences;
    final userData = json.encode(
      {
        'token': token,
        'userId': userid,
      },
    );
    prefs.setString('userData', userData);
  }

  static Future<MapEntry?> getData() async {
    final prefs = myServices.sharedPreferences;
    if (!prefs.containsKey('userData')) return null;
    final extractedUserData =
    json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    var token = extractedUserData['token'].toString();
    var userid = int.parse(extractedUserData['userId'].toString());
    return MapEntry(userid, token);
  }

  static Future<void> logout(String? token) async {

    final response = await dio.post(
        authEndpoint,
        options: Options(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType:ResponseType.json,
          headers: {
            "Authorization":  "Bearer $token"
          },
        )
    );
    deleteData();
  }
  static Future<void> deleteData() async {
    final prefs = myServices.sharedPreferences;
    if(prefs.containsKey('userData')) {
      prefs.remove('userData');
      prefs.clear();
    }
  }

}
