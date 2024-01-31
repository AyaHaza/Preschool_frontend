import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Template.dart';
import 'BusEditContent.dart';



class BusEdit extends StatelessWidget {
  static const routeName = '/Bus/Edit';

  @override
  Widget build(BuildContext context) {
    return Template(
      text: 'Bus Edit', Content: BusContentEdit(id: Get.arguments[0]),);

  }
}
