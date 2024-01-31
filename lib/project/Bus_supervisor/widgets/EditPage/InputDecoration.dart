
import 'package:flutter/material.dart';
import 'package:project/CONSTANT/colors.dart';

InputDecoration decoration() {
  return InputDecoration(
    border: const OutlineInputBorder(
        borderSide: BorderSide(width: 30, color: Colors.black)),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.barBg),
    ),
  );
}
