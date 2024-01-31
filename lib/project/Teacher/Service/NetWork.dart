

import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/size_config.dart';

import '../Controller/Authentication/AuthController.dart';
import '../Model/Model.dart';
import 'Authentication/AuthNetwork.dart';
import 'package:http/http.dart'as http;

class Network {
  static Dio dio=new Dio() ;
  Network() {
    if (dio == null) {
      BaseOptions options = new BaseOptions(
          baseUrl: "http://192.168.43.178/api",
          receiveDataWhenStatusError: true,
          connectTimeout: Duration(seconds: 60), // 60 seconds
          receiveTimeout: Duration(seconds: 60) // 60 seconds
      );

      dio = new Dio(options);
    }
  }
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
  static Future<Map<String, dynamic>> StoreWithFiles(Model model, String authEndpoint,img) async {
    await initConnectivity();
    print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${auth.user!.token}"

    };

    if (connectionStatus != ConnectivityResult.none) {
      var response = await http.MultipartRequest('POST', Uri.parse(authEndpoint));
      response.headers.addAll(headers);
      response.files.add(img);
      var responsed = await response.send();
      var r = await http.Response.fromStream(responsed);
      var rr = model.toJson();
      print(responsed.statusCode);

      print(rr);
      Map<String, dynamic> m = rr;
      if (!m.containsKey("status")) {
        m.addAll({'status': responsed.statusCode});
      }
      return m;}

    throw "Error Connection ! No Internet";
  }

  static Future<Map<String, dynamic>> Store(Model model, String authEndpoint) async {
    await initConnectivity();
    print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
    print(model.toJson());
    print(authEndpoint);
    print(auth.user!.token);
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
      print(response.statusCode);
      Map<String, dynamic> m = response.data;
      if (!m.containsKey("status")) {
        m.addAll({'status': response.statusCode});
      }
      return m;}

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
    print("${authEndpoint}/${editData.id}");
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
      print(response.statusCode);
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
      print(response.data);
      Map<String, dynamic> m = response.data;
      if (!m.containsKey("status")) {
        m.addAll({'status': response.statusCode});
      }
      return m;
    }
    throw "Error Connection ! No Internet";
  }

//  static Future<void> DeleteEmp(int? id, String authEndpoint) async {   Map<int?, String?>? Emp = {};
//     try {
//       print('dgdgdgdgdgdgdgdgdgdg');
//       final response = await dio.delete(
//         '${authEndpoint}/${id}',
//         options: Options(
//           validateStatus: (_) => true,
//           contentType: Headers.jsonContentType,
//           responseType: ResponseType.json,
//           headers: {
//             "Authorization": "Bearer 31|1Et1uw9iIPcbA7YmyUbKlEVruVo1qcTxS7YnD8MT"
//           },
//         ),
//       );
//       print(response.statusCode);
//       Emp.remove(id);
//    //  update();
//     } catch (error) {
//       print(error);
//       throw error;
//     }
//   }
  static Future<Map<String, dynamic>> uploadProfile(img,name, String authEndpoint) async {
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

  static Future<Map<String, dynamic>> upload( name,img, String authEndpoint) async {
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${auth.user!.token}"
    };
    var response = await http.MultipartRequest('POST', Uri.parse(authEndpoint));
    response.fields['name'] = name!;
    response.headers.addAll(headers);
    print(img!.path);


    var pic = await http.MultipartFile.fromPath('img', img!.path);
    print(img.path);
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
  static Future<Map<String, dynamic>> uploadssss( name, String authEndpoint,nameImg) async {
    print("lllllllllllllllllllllllljjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
    print(SizeConfig.id_pic);
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${auth.user!.token}"
    };
    var response = await http.MultipartRequest('POST', Uri.parse(authEndpoint));
    response.fields['name'] = name!;
    response.headers.addAll(headers);



    var pic = await http.MultipartFile.fromPath('img',"/data/user/0/com.example.project/cache/file_picker/1692134481math-6683827_640.png");
 print("kkkkkkkkkkkkkkvvvvvvvvvvvvvvvvvvv");
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


  static Future<Map<String, dynamic>> uploadExam( ppuplishDate,statuss,term,type,datee,file, String authEndpoint) async {
    // print(img!.path);
    // print(controller.Data!.name);
    // var url = Uri.parse('http://192.168.1.103:80/api/categories');
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer ${auth.user!.token}"
    };
    var response = await http.MultipartRequest('POST', Uri.parse(authEndpoint));
    response.fields['status'] = statuss!;
    response.fields['term'] = term!;
    response.fields['type'] = type!;
    response.fields['publish_date'] = '${datee} ${ppuplishDate}';
    response.fields['subject_id'] = SizeConfig.id_subjectExam;
    response.headers.addAll(headers);
    print(file);
    print(statuss);
    print(authEndpoint);
    print(type);
    print(term);
    print("${datee} ${ppuplishDate}");
    print(SizeConfig.id_subjectExam);


    var pic = await http.MultipartFile.fromPath('file', file);
    response.files.add(pic);

    var responsed = await response.send();

    print(responsed.statusCode);
    var r = await http.Response.fromStream(responsed);
    Map<String, dynamic> rr = json.decode(r.body);


    print(rr);
    //Get.back();
    Map<String, dynamic> m = rr;
    if (!m.containsKey("status")) {
      m.addAll({'status': responsed.statusCode});
    }
    return m;
    // return r.body
  }




  static Future<Map<String, dynamic>> uploadQ( text,answertexts,answerImages,correct_answer_symbol,audio,category_id, String authEndpoint) async {
    var r;var response;var responsed;

      var headers = {
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${auth.user!.token}"
      };
      response =



      await http.MultipartRequest(
          'POST', Uri.parse(authEndpoint));
      response.fields['text'] = text!;
      response.fields['correct_answer_symbol'] = correct_answer_symbol!;
      // response.fields['audio'] = 'sssss.mp3';
      response.fields['category_id'] = category_id!;
      response.fields['answers[0][text]'] = answertexts[0].toString();
    response.fields['answers[1][text]'] = answertexts[1].toString();
    response.fields['answers[2][text]'] = answertexts[2].toString();
    response.fields['answers[3][text]'] = answertexts[3].toString();
      response.headers.addAll(headers);
      // print(img!.path);

      // var sound = await http.MultipartFile.fromPath('audio', answerImages[0]!.path);
      // response.files.add(sound);



    Future<void> getFileLength() async {
      try {
        File file = File('/data/user/0/com.example.project/cache/file_picker/answers/img/1692355455IMG-20230818-WA0011.jpg');
        bool fileExists = await file.exists();

        if (fileExists) {
          int length = await file.length();
          print('File length: $length bytes');
        } else {
          print('File does not exist');
        }
      } catch (e) {
        print('Error retrieving file length: $e');
      }
    }


      var pic = await http.MultipartFile.fromPath('answers[0][img]', answerImages[0]);
    var pic1 = await http.MultipartFile.fromPath('answers[1][img]', answerImages[1]);
    var pic2 = await http.MultipartFile.fromPath('answers[2][img]', answerImages[2]);
    var pic3 = await http.MultipartFile.fromPath('answers[3][img]', answerImages[3]);

      response.files.add(pic);
    response.files.add(pic1);
    response.files.add(pic2);
    response.files.add(pic3);
      responsed = await response.send();
      print(responsed.statusCode);

      // return r.body


    print(responsed);
    r = await http.Response.fromStream(responsed);
    print(r.body);
    Map<String, dynamic> m = json.decode(r.body);
    if (!m.containsKey("status")) {
      m.addAll({'status': responsed.statusCode});
    }
    return m;}

}