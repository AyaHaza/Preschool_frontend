import 'package:flutter/material.dart';

import 'AllSubjectsContent.dart';
import '../../Template.dart';

class AllSubjects extends StatelessWidget {
  static const routeName = '/AllSubjects';
  @override
  Widget build(BuildContext context) {
    //return AllSubjectContent();
     return Template( body: AllSubjectContent(), title: 'All Subjectes',);
  }
}
