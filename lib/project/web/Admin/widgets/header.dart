import 'package:flutter/material.dart';
import '/CONSTANT/colors.dart';
import '/CONSTANT/responsive.dart';
import 'StyleText.dart';
import 'appBarActionItems.dart';

class Header extends StatelessWidget {
  final String text;

  const Header({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
           StyleText(text: text, size: 30, fontWeight: FontWeight.w800)
    ]
    );
  }
}
