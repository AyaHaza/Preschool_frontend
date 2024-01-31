import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Template.dart';
import 'HomeContent.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/Home';
  @override
  Widget build(BuildContext context) {
  return Template(text: 'HomePge', Content: Homepagecontent(),);
  }
}
