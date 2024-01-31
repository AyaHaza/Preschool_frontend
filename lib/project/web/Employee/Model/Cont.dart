import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';

import 'Model.dart';

class Count extends Model {
  int? student_count;
  int? employee_count;
  int? teacher_count;
  int? bus_count;




  Count({
    this.bus_count,
    this.employee_count,
    this.student_count,
    this.teacher_count,
    id,
  }):super(id: id);


  factory Count.fromJson(Map<String, dynamic> json) => Count(
    id: json["id"],
    student_count: json['student_count'],
    employee_count: json['employee_count'],
    teacher_count: json['teacher_count'],
    bus_count: json['bus_count'],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "student_count": student_count,
    "employee_count": employee_count,
    "teacher_count": teacher_count,
    "bus_count": bus_count,
  };
}
