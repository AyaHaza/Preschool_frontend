import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/CONSTANT/colors.dart';

Widget TextField1(String label, Widget text, String error) {
  return SizedBox(
      width: 200.w,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            SizedBox(height: 50.h, child: text),
            SizedBox(
                height: 40.h,
                child: Text(
                  error,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.card1),
                )),
          ],
        ),
      ));
}