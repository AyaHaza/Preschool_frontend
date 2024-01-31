
import 'package:flutter/foundation.dart';

import 'Model.dart';

class File  extends Model{
  String? path;
  String? status;
  String? name;
  Uint8List? uploadfile;
  String? extention;
  File({
     this.path,
     this.status,
    this.name,
    this.extention,
    this.uploadfile,
    id,
  }):super(id: id);


  factory File.fromJson(Map<String, dynamic> json) => File(
    path: json["path"],
    status: json["status"],
    id: json["id"],
    name: json["name"]
  );

  Map<String, dynamic> toJson() => {
    "path": path,
    "status": status,
    "name":name
  };
}
