import 'package:flutter/material.dart';

import 'Location.dart';
import 'Model.dart';

class School extends Model{
  String name;
  int phone;
  Location? location;
  DateTime BusTime = DateTime.now();
  School({
    required this.name,
    required this.phone,
    required this.BusTime,
    this.location,
    id,
  }):super(id: id);


  factory School.fromJson(Map<String, dynamic> json) => School(
    name: json["name"],
    phone: json["phone"],
    BusTime: DateTime.parse("2021-12-23 ${json["start_time"]}"),
    location:Location(lng: json["lng"],lat: json["lat"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "id": id,
    "start_time":"${BusTime!.hour}:${BusTime!.minute}"
  };
}