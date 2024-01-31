import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';

import 'Model.dart';

class BusRate extends Model {
  int? student_with_bus;
  int? student_without_bus;




  BusRate({
    this.student_with_bus,
    this.student_without_bus,
    id,
  }):super(id: id);


  factory BusRate.fromJson(Map<String, dynamic> json) => BusRate(
    id: json["id"],
    student_with_bus: json['student_with_bus'],
    student_without_bus: json['student_without_bus'],


  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "student_with_bus": student_with_bus,
    "student_without_bus": student_without_bus,
  };
}
