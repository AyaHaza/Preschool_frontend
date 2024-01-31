import 'dart:convert';

import 'AbsentStudent.dart';
import 'Model.dart';

class AbsentStudentList extends Model {

  List<AbsentStudent> Absents=[];
  AbsentStudentList({required this.Absents});
  Map<String, dynamic> toJson() => {"\"data\"":List<dynamic>.from(Absents.map((x) => x.toJson()))};

}