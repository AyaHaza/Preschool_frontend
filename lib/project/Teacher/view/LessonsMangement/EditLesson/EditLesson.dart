import 'package:flutter/material.dart';

import '../../../Model/AllLessons.dart';
import 'EditLessonContent.dart';


class EditLesson extends StatelessWidget {
  int?index;
  List<AllLesson>?  SubjectLesson =[];
  int?classid;

  EditLesson({required this.index,required this.SubjectLesson,required this.classid});
  static const routeName = '/Alllesson/Edit';
  @override
  Widget build(BuildContext context) {
    return EditLessonContent(index:index,SubjectLesson: SubjectLesson,classid: classid,);
    // return Template( Content: AllCatContent(),);
  }
  

}
