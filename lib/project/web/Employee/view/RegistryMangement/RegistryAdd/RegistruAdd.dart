import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Template.dart';
import 'RegistryAddForm.dart';



class RegisteryAdd extends StatelessWidget {
  static const routeName = '/Registry/Add';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Registry ADD', Content: RegistryAddForm(),);
  }
}
