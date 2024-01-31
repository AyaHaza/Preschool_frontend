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
        color: Colors.white,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(4.0, 5.0),
            blurRadius: 8.0,
            color: Colors.black26,
          ),
        ],
      ),
    );
  }
}
