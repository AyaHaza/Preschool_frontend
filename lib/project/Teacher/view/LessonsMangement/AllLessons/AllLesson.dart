import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AllLessonContent.dart';




class AllLessons extends StatelessWidget {
  static const routeName = '/AllLessons';
  int Subjectid = Get.arguments[1];
  int Classid  = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    print("Dddddddddddddddddddddd");
    print("subject id $Subjectid ");
    print("Classid id $Classid ");

    return AllLessonsContent(Subjectid: Subjectid,Classid: Classid,);
    // return Template( Content: AllCatContent(),);
  }
}
