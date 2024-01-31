import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';

import 'Model.dart';

class Location  extends Model {
  double? lng;
  double? lat;

  Location({
    id,
    this.lat,
    this.lng
  }):super(id: id);


  factory Location.fromJson(Map<String, dynamic> json) => Location(
    lng: json['lng'],
    lat: json['lat'],
  );

  Map<String, dynamic> toJson() => {
    "lat":lat,
    "lng":lng
  };
}
