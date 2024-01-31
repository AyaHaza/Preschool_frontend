import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'view.dart';
import '../Template.dart';

class FileManagemet extends StatelessWidget {
  static const routeName = '/Files';
  @override
  Widget build(BuildContext context) {
    return Template(title: 'File Management', body: content(),);
  }
}
