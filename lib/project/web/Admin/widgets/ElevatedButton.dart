
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonElevated extends StatelessWidget {
  IconData icon;
  Function? function;
  String text;
  Color color;

  ButtonElevated(
      {required this.color,required this.text, required this.function, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon,color:color ,),
      onPressed:()=>function!(),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor:
            Colors.black.withOpacity(0.7),
      ),
      label: Container(
        height: 30.h,
        child: Text(
          text,
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
