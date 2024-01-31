import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/CONSTANT/colors.dart';
import '/CONSTANT/responsive.dart';
import 'Advertisement/Chat.dart';
import 'StyleText.dart';
import 'appBarActionItems.dart';

class Header2 extends StatelessWidget  with PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return  Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
    // SizedBox(
    //     width: 180.w,
    //     height: 40.h,
    // child: chats()),
            // SizedBox(
            //   width: 170.w,
            //   height: 40.h,
            //   child: TextField(
            //     decoration: InputDecoration(
            //         filled: true,
            //         fillColor: Colors.grey.withOpacity(0.2),
            //         contentPadding: EdgeInsets.only(left: 40.0, right: 5),
            //         enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(30),
            //           borderSide: BorderSide(color: AppColors.white),
            //         ),
            //         focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(30),
            //           borderSide: BorderSide(color: AppColors.white),
            //         ),
            //         prefixIcon: Icon(Icons.search, color: AppColors.black),
            //         hintText: 'Search',
            //         hintStyle: TextStyle(color: AppColors.secondary, fontSize: 14)),
            //   ),
            // ),
         AppBarActionItems()
      ]
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
