import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Template.dart';
import 'configForm.dart';


class ConfigAdd extends StatelessWidget {
  static const routeName = '/Config/Add';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Configuration ADD', Content: ConfigForm(),);
  }
}
