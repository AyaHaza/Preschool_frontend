import 'package:flutter/material.dart';
import '../../Template.dart';
import 'busStudentscontent.dart';

import 'package:get/get.dart';


class BusStudents extends StatelessWidget {
  static const routeName = '/Bus/Students';

  @override
  Widget build(BuildContext context) {
    return Template(text: 'Bus Management', Content: BusStudentsContent(id: Get.arguments[0]),);
  }
}
