import 'package:flutter/material.dart';

import 'EditHomeworkContent.dart';

class EditHomework extends StatelessWidget {
  int?index;
  EditHomework({this.index});
  static const routeName = '/Homework/Edit';
  @override
  Widget build(BuildContext context) {
    return EditHomeworkContent(index:index);
    // return Template( Content: AllCatContent(),);
  }
  

}
