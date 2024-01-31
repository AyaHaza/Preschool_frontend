import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Template.dart';
import 'BussAddForm.dart';




class BusAdd extends StatelessWidget {
  static const routeName = '/Bus/Add';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Bus ADD', Content: BusAddForm(),);
  }
}
