import 'package:flutter/material.dart';
import '../../Template.dart';
import 'AllCategoriesContent.dart';


class AllCategory extends StatelessWidget {
  static const routeName = '/AllCat';
  @override
  Widget build(BuildContext context) {
    //return AllCatContent();
     return Template( body: AllCatContent(), title: 'Categories Quize',);
  }
}
