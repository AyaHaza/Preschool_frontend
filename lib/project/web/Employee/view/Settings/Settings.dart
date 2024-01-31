import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:accordion/accordion.dart';

import 'location_setting.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Template.dart';
import 'vrp.dart';

class Settings extends StatelessWidget {
  static const routeName = '/Settings';

  @override
  Widget build(BuildContext context) {
    return Template(
      text: 'Settings', Content:  Accordion(
      maxOpenSections: 2,
      leftIcon: Icon(Icons.settings, color: Colors.white),
      children: [
        AccordionSection(
          isOpen: false,
          header: Text(' Location settings',style:TextStyle(color: Colors.white, fontSize: 17)),
          content:Edit_Location(),
        ),
        AccordionSection(
          isOpen: false,
          header: Text(' Students Bus Assignment settings',style:TextStyle(color: Colors.white, fontSize: 17)),
          content:VRP(),
        ),
      ],
    ),
    );

  }
}
