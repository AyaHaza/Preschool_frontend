import 'package:flutter/material.dart';
import 'Coloring.dart';
import 'Template.dart';

class Colore extends StatelessWidget {
  static const routeName = '/Color';
  @override
  Widget build(BuildContext context) {
    // return AllCatContent();
    return Template( body: ColorDropDown(),title: "Coloring",);
  }
}
