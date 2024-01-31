import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Template.dart';
import 'Form.dart';

class LevelAdd extends StatelessWidget {
  static const routeName = '/Level/Add';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Level ADD', Content: LevelForm(),);
  }
}
