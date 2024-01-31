import 'package:flutter/material.dart';
import '/CONSTANT/colors.dart';

class StyleText extends StatelessWidget {
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final double height;


  const StyleText({
    required this.text,
    this.fontWeight: FontWeight.w400,
    this.color: AppColors.primary,
    this.size: 20,
    this.height: 1.3, 
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: TextStyle(
          color: color,
          height: height,
          fontSize: size,
          fontWeight: fontWeight,
        ),
        
);
  }
}
