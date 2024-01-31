import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Menue.dart';


class AppBarActionItems extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      runSpacing: 5.0,
      direction: Axis.vertical,
      children: [
        Row(children:  [

          MyCascadingMenu(),

       ]),
      ],
    );
  }
}
