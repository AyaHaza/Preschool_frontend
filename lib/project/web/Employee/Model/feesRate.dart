import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';

import 'Model.dart';

class feesRate extends Model {
  int? full;
  int? paided;
  int? unpaided;




  feesRate({
    this.full,
    this.paided,
    this.unpaided,
    id,
  }):super(id: id);


  factory feesRate.fromJson(Map<String, dynamic> json) => feesRate(
    id: json["id"],
    full: json['full'],
    paided: json['paided'],
    unpaided: json['unpaided'],


  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full": full,
    "paided": paided,
    "unpaided": unpaided,
  };
}
