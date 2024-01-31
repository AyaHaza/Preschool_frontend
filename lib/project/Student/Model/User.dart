import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';

import 'Model.dart';

class User  extends Model {
  String? name;
  String? newPassword;
  String? currentPassword;
  String? token;
  String? role;
  int? class_id;
  String? photo;
  int? bus_id;



  User({
    id,
    this.token,
    this.currentPassword,
    this.newPassword,
    this.name,
    this.role,
    this.bus_id,
    this.class_id,
    // this.status,
    this.photo
  }):super(id: id);



  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    newPassword: json['password'],
    currentPassword: json['current_password'],
    name: json["name"],
    photo: json["profile_photo_path"],
    role: json["role"],
    class_id: json["class_id"],
    bus_id:json["bus_id"],
    // status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "current_password":currentPassword,
    "password":newPassword,
     "bus_id":bus_id,
    "profile_photo_path":photo,
    // "photo":photo!=null? MultipartFile.fromFile(photo!.path, filename: basename(photo!.path)):null,
    "role": role,
    // "status": status,
    "class_id":class_id
  };
}
