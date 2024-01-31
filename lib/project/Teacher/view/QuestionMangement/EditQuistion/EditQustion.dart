import 'package:flutter/material.dart';

import 'EditQustionContent.dart';


class EditQuestionTeacher extends StatelessWidget {
  int?index;
  String ?a1;
  String ?a2;
  String ?a3;
  String ?a4;
  EditQuestionTeacher({this.index,this.a1,this.a2,this.a3,this.a4});
  static const routeName = '/AllCat/Qusions/Edit';
  @override
  Widget build(BuildContext context) {
    print("kigjk");
    return  EditQuestionTeacherContent(index:index,a1:a1,a2:a2,a3:a3,a4:a4);
  }
}
