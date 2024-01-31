import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Template.dart';
import 'classForm.dart';


  class AllClasses extends StatelessWidget {
  static const routeName = '/AllSubjectClasses';
  int Subjectid= Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    //return AllSubjectContentL();
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
    print("subject id $Subjectid ");

    return Template( body: ClassSubjectView(Subjectid :Subjectid),title: "Subject classes",);
  }
}
