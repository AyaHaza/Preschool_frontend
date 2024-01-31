import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Controller/Authentication/AuthController.dart';
import '../Model/Model.dart';
import 'Authentication/AuthNetwork.dart';

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
      print(response.data);
      Map<String, dynamic> m = response.data;
      if (!m.containsKey("status")) {
        m.addAll({'status': response.statusCode});
      }
      return m;
    }
    throw "Error Connection ! No Internet";
  }

  static Future<Map<String, dynamic>> fetch(String authEndpoint) async {
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
      print("fffffffffffffff");
      print(authEndpoint);
      Map<String, dynamic> m = response.data;
      print(m);
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
  static Future<Map<String, dynamic>> Edit_Status( String authEndpoint) async {
    await initConnectivity();
    if (connectionStatus != ConnectivityResult.none) {
      final response = await dio.put(
          "$authEndpoint",
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

      return m;
    }
    throw "Error Connection ! No Internet";
  }


  static Future<Map<String, dynamic>> EditEmp(Model editData, String authEndpoint) async {
    await initConnectivity();
    if (connectionStatus != ConnectivityResult.none) {
      final response = await dio.post(
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
      print(id);
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
      print(response.data);
      Map<String, dynamic> m = response.data;
      if (!m.containsKey("status")) {
        m.addAll({'status': response.statusCode});
      }
      return response.data;
    }
    throw "Error Connection ! No Internet";
  }




//static final Dio dio = Dio();

// static const authEndpoint = "$baseUrl/employee";
// static Future<void> DeleteEmp(int? id, String authEndpoint) async {   Map<int?, String?>? Emp = {};
//   try {
//     print('dgdgdgdgdgdgdgdgdgdg');
//     final response = await dio.delete(
//       '${authEndpoint}/${id}',
//       options: Options(
//         validateStatus: (_) => true,
//         contentType: Headers.jsonContentType,
//         responseType: ResponseType.json,
//         headers: {
//           "Authorization": "Bearer 14|ZKBxvGUdiBlwUBYeJv9dUa416IBrEK4qsq9J4pY8"
//         },
//       ),
//     );
//     print(response.statusCode);
//     Emp.remove(id);
//  //  update();
//   } catch (error) {
//     print(error);
//     throw error;
//   }
// }


}