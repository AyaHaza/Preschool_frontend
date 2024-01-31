import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:accordion/accordion.dart';
import '../Template.dart';
import 'Bus_location_setting.dart';


class Settings extends StatelessWidget {
  static const routeName = '/Settings';

  @override
  Widget build(BuildContext context) {
    return Template(
     title: "Settings",
      body: Accordion(
        maxOpenSections: 2,
        leftIcon: Icon(Icons.settings, color: Colors.white),
        children: [
          AccordionSection(
            isOpen: false,
            header: Text('Bus Location settings',style:TextStyle(color: Colors.white, fontSize: 17)),
            content:Edit_Location(),
          ),

        ],
      ),

    );
  }
}