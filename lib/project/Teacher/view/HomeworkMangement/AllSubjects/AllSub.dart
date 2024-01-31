import 'package:flutter/material.dart';

import 'AllSubContent.dart';

import '../../Template.dart';


class AllSubjectsLH extends StatelessWidget {
  static const routeName = '/AllSubjectslESSONSHomework';
  @override
  Widget build(BuildContext context) {
    //return AllSubjectContentLH();
     return Template( body: AllSubjectContentLH(),title: "All Subjectes",);
  }
}
