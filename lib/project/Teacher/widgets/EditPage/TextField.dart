import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../CONSTANT/colors.dart';

Widget TextField1(String? label, Widget text, String error) {
  return SizedBox(
      width: 300.w,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10.w),
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.start,
          children: [
            Text(
              label!,
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(width:300.w,height: 30.h, child: text),
            Text(
              error,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.card2),
            ),
          ],
        ),
      ));
}