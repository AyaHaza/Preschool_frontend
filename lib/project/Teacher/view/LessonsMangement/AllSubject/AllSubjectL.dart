import 'package:flutter/material.dart';

import 'AllSubjectContentL.dart';
import '../../Template.dart';


class AllSubjectsL extends StatelessWidget {
  static const routeName = '/AllSubjectslESSONS';
  @override
  Widget build(BuildContext context) {
    //return AllSubjectContentL();
     return Template( body: AllSubjectContentL(),title: "All Subjectes",);
  }
}
