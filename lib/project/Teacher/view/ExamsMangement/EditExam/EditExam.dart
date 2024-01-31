import 'package:flutter/material.dart';

import 'EditExamContent.dart';


class EditExam extends StatelessWidget {
  int?index;
  String?name;
  EditExam({this.index,this.name});
  static const routeName = '/AllExams/Edit';
  @override
  Widget build(BuildContext context) {
    return AEditExamContent(index:index,name:name);
    // return Template( Content: AllCatContent(),);
  }
}
