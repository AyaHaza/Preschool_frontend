import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import '../../Model/Location.dart'as loc;
import '../../widgets/Dialogs/ErrorDialog.dart';
import 'package:http/http.dart' as http;

String baseUrl = 'https://api.mapbox.com/directions/v5/mapbox';
String navType = 'driving-traffic';
Dio _dio = Dio();

Future getCyclingRouteUsingMapbox(List<loc.Location> locations)//LatLng source, LatLng destination)
 async {
   String points ="";
   locations.forEach((element) {
     points+="${element.lng},${element.lat};";
   });
   points = points.substring(0, points.length - 1);
   String url =     '$baseUrl/$navType/$points';
   print(url);
   final queryParameters={
     'alternatives': false,
     'continue_straight': true,
     'geometries': 'geojson',
     'language': 'ae',
     'overview': 'full',
     'steps': true,
     'access_token': 'sk.eyJ1IjoiZ2hhZGVlcjU5NTkiLCJhIjoiY2xnbzdkdHd2MGJ5MDNqbXR3cHVydHgzdCJ9.B14azwScdKbW1Zcv2J79iQ',
   };
  // String url =     'https://api.mapbox.com/directions/v5/mapbox/driving-traffic/36.253619,33.502173;36.2504678,33.5015404';
  try {
    _dio.options.contentType = Headers.jsonContentType;
    final responseData = await _dio.get(url,
        options: Options(
          validateStatus: (_) => true,),
      queryParameters: {
       'alternatives': false,
        'continue_straight': true,
        'geometries': 'geojson',
        'language': 'ae',
        'overview': 'full',
        'steps': true,
        'access_token': 'sk.eyJ1IjoiZ2hhZGVlcjU5NTkiLCJhIjoiY2xnbzdkdHd2MGJ5MDNqbXR3cHVydHgzdCJ9.B14azwScdKbW1Zcv2J79iQ',
      },
    );
    // final response = await http.get(
    //   Uri.http("api.mapbox.com","/directions/v5/mapbox/$navType/$points",queryParameters),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //
    // );
    // print(responseData.data);
    // return responseData.data;
    print("kkkkkkkkkkkkkkkkkkkkkkjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
    print(responseData.data);
    return responseData.data;
  } catch (e) {
    print(e);
  }
}