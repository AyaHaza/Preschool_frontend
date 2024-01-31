



import 'package:flutter/foundation.dart';

abstract class Model{
  @protected int? id;
  Model({this.id});
  Model.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson() =>{};
}