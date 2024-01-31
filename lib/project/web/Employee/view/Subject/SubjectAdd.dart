import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Template.dart';
import 'SubjectForm.dart';

class SubjectAdd extends StatelessWidget {
  static const routeName = '/Subject/Add';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Subject ADD', Content: SubjectForm(),);
  }
}
