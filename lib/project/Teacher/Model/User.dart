import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';

import 'Model.dart';

class User  extends Model {
  String? name="";
  String? newPassword="";
  String? currentPassword="";
  String? token="";
  String? role="";
  int? class_id=0;
  // String? status;
  String? photo="";


  User({
    id,
    this.token,
    this.currentPassword,
    this.newPassword,
    this.name,
    this.role,
    this.class_id,
    // this.status,
    this.photo
  }):super(id: id);



  factory User.fromJson(Map<String, dynamic> json) {
    User user = User(
      id: json["id"],
      newPassword: json['password'],
      currentPassword: json['current_password'],
      name: json["name"],
      photo: json["profile_photo_path"],
      role: json["role"],
       class_id: json.containsKey("class_id") ? json["class_id"]: null,
      // status: json["status"],
    );
    return user;
  }
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "current_password":currentPassword,
    "password":newPassword,
    "profile_photo_path":photo,
    // "photo":photo!=null? MultipartFile.fromFile(photo!.path, filename: basename(photo!.path)):null,
    "role": role,
    // "status": status,
    "class_id":class_id
  };
}
