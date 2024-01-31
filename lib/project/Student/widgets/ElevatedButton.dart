import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonElevated extends StatelessWidget {
  Icon icon;
  Function function;
  String text;

  ButtonElevated(
      {required this.text, required this.function, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(Icons.login),
      onPressed: () => function(),
      style: ElevatedButton.styleFrom(
        elevation: 1,
        backgroundColor:
            Colors.white.withOpacity(0.5),
      ),
      label: Container(
        height: 30.h,
        width: 130.w,
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
