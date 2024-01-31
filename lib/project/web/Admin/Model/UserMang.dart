import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';

import 'Model.dart';

class UserMang  extends Model {
  String? name;
  String? role;
  String? status;




  UserMang({
    id,
    this.name,
    this.role,
    this.status,
  }):super(id: id);



  factory UserMang.fromJson(Map<String, dynamic> json) => UserMang(
    id: json["id"],
    name: json["name"],
    role: json["role"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "role": role,
    "status": status,
  };
}
