import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Controller/Authentication/AuthController.dart';
import '../Model/Model.dart';
import 'package:http/http.dart'as http;

class Network {
  static final Dio dio = Dio();
  static AuthController auth = Get.find();
  static final Connectivity _connectivity = Connectivity();

  static ConnectivityResult? connectionStatus;


  static Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print('Couldn\'t check connectivity status $e');
      return;
    }
    connectionStatus = result;
  }

  static Future<Map<String, dynamic>> Store(Model model, String authEndpoint) async {
    print("Ffffffffffffffffffffffffffff");
    print(model.toJson());
    await initConnectivity();
    if (connectionStatus != ConnectivityResult.none) {
    final response = await dio.post(
        authEndpoint,
        options: Options(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          headers: {
            "Authorization": "Bearer ${auth.user!.token}"
          },
        ),
        data: model.toJson()
    );
    Map<String, dynamic> m = response.data;
    if (!m.containsKey("status")) {
      m.addAll({'status': response.statusCode});
    }
    return m;
  }
    throw "Error Connection ! No Internet";
  }

  static Future<Map<String, dynamic>> fetch(String authEndpoint) async {
    if(auth==null)
      print("aaaauthhhh null");
    if(auth.user==null)
      print("useeeerrrrrrrrrr null");
    await initConnectivity();
    if (connectionStatus != ConnectivityResult.none) {
      final response = await dio.get(
          authEndpoint,
          options: Options(
            validateStatus: (_) => true,
    //        sendTimeout: const Duration(seconds: 0),
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
            headers: {
              "Authorization": "Bearer ${auth.user!.token}"
          },
          )
      );
      print(response.data);
      Map<String, dynamic> m = response.data;
      if (!m.containsKey("status")) {
        m.addAll({'status': response.statusCode});
      }
      return m;
    }
    throw "Error Connection ! No Internet";
  }

  static Future<Map<String, dynamic>> Edit(Model editData, String authEndpoint) async {
    await initConnectivity();
    if (connectionStatus != ConnectivityResult.none) {
      final response = await dio.put(
          "$authEndpoint/${editData.id}",
          data: editData.toJson(),
          options: Options(
            validateStatus: (_) => true,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
            headers: {
              "Authorization": "Bearer ${auth.user!.token}"
            },)
      );
      print(response.data);
      Map<String, dynamic> m = response.data;
      if (!m.containsKey("status")) {
        m.addAll({'status': response.statusCode});
      }
      return m;
    }
    throw "Error Connection ! No Internet";
  }

  static Future<Map<String, dynamic>> Delete(int id,
      String authEndpoint) async {
    await initConnectivity();
    if (connectionStatus != ConnectivityResult.none) {
      final response = await dio.delete(
          "$authEndpoint/$id",
          options: Options(
            validateStatus: (_) => true,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
            headers: {
              "Authorization": "Bearer ${auth.user!.token}"
            },)
      );
      Map<String, dynamic> m = response.data;
      if (!m.containsKey("status")) {
        m.addAll({'status': response.statusCode});
      }
      return m;
    }
    throw "Error Connection ! No Internet";
  }
  static Future<Map<String, dynamic>> upload(img,name, String authEndpoint) async {
    print(img.path);
    print(name);
    print(authEndpoint);
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${auth.user!.token}"
    };
    var response = await http.MultipartRequest('POST', Uri.parse(authEndpoint));
    response.fields['name'] = name!;
    response.headers.addAll(headers);
    print(img!.path);


    var pic = await http.MultipartFile.fromPath('profile_photo_path', img!.path);
    response.files.add(pic);

    var responsed = await response.send();

    print(responsed);
    var r = await http.Response.fromStream(responsed);
    Map<String, dynamic> rr = json.decode(r.body);
    print(responsed.statusCode);

    print(rr);
    //Get.back();
    Map<String, dynamic> m = rr;
    if (!m.containsKey("status")) {
      m.addAll({'status': responsed.statusCode});
    }
    return m;
    // return r.body
  }

}