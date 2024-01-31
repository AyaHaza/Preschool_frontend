

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class Dialogs {

  static void Error(String error) {
    Get.defaultDialog(
      title: "ERROR",
      middleText: error,
      backgroundColor: Colors.white,
      titleStyle: TextStyle(color: Colors.black),
      middleTextStyle: TextStyle(color: Colors.grey),
      textConfirm: "OK",
      cancelTextColor: Colors.white,
      buttonColor: Colors.red,
      barrierDismissible: true,
      radius: 10,
      onConfirm: () => Get.back(),
    );
  }

  static void Success(String msg) {
    Get.defaultDialog(
      title: "Success",
      middleText: msg,
      backgroundColor: Colors.white,
      titleStyle: TextStyle(color: Colors.black),
      middleTextStyle: TextStyle(color: Colors.grey),
      textConfirm: "OK",
      cancelTextColor: Colors.white,
      buttonColor: Colors.green,
      barrierDismissible: true,
      radius: 10,
      onConfirm: () { Get.back();
      },
    );
  }
  static void SuccessEdit(String msg,String? pageroute) {
    Get.defaultDialog(
      title: "Success",
      middleText: msg,
      backgroundColor: Colors.white,
      titleStyle: TextStyle(color: Colors.black),
      middleTextStyle: TextStyle(color: Colors.grey),
      textConfirm: "OK",
      cancelTextColor: Colors.white,
      buttonColor: Colors.green,
      barrierDismissible: true,
      radius: 10,
      onConfirm: () {
    if(pageroute!=null) {
      Get.offAndToNamed(pageroute);
    }else {
      Get.back();
    }
      },
    );
  }


  static void Info(String title,Widget widget) {
    Get.defaultDialog(
      title: title,
      content: SizedBox(width:300.w,child: widget),
      backgroundColor: Colors.white,
      titleStyle: TextStyle(color: Colors.black),
      middleTextStyle: TextStyle(color: Colors.grey),
      textConfirm: "OK",
      cancelTextColor: Colors.white,
      buttonColor: Colors.blue,
      barrierDismissible: true,
      radius: 10,
      onConfirm: () => Get.back(),
    );
  }
  static void Confirm(String title,Function confirm) {
    Get.defaultDialog(
      title:title ,
      content: SizedBox(width:300.w,child: Text("")),
      backgroundColor: Colors.white,
      titleStyle: TextStyle(color: Colors.black,fontSize: 20.sp),
      middleTextStyle: TextStyle(color: Colors.grey),
      cancelTextColor: Colors.white,
      buttonColor: Colors.blue,
      barrierDismissible: true,
      radius: 10,
      actions: <Widget>[
        FloatingActionButton(
          focusColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))
          ),
          backgroundColor: Colors.grey.shade50,
          child: Text("No"),
          onPressed: () {
            Get.back();
          },
        ),
        FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))
            ),
            focusColor: Colors.white,
            backgroundColor: Colors.blue.shade50,
            child: Text("Yes"),
            onPressed: ()=>confirm()
        )
      ],
    );
  }



}