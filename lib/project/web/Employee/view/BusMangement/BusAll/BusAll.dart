import 'package:flutter/material.dart';
import '../../Template.dart';
import 'BusAllContent.dart';



class BusManagemet extends StatelessWidget {
  static const routeName = '/Bus/Management';
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Bus Management', Content: BusManagementContent(),);
  }
}
