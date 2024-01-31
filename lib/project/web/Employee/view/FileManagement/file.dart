import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Template.dart';

class File extends StatelessWidget {
  static const routeName = '/File';
  Widget content;
  File({required this.content});
  @override
  Widget build(BuildContext context) {
    return Template(text: 'File', Content: content,);
  }
}
