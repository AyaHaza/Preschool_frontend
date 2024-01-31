import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextBlod extends StatelessWidget {
  String text;
  double size;

  TextBlod({required this.text,required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Righteous',
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
