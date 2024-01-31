import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeConfig {
  static String id_question='';
  static String id_student='';
  static String id_Lesson='';
  static String id_pic='';
  static String id_Sub_Lesson='';
  static String id_exam='';
  static String id_subjectExam='';
  static String id_Cat='';
  static String id_Class='';
  static String id_ClassSub='';
  static String id_Sub='';
  static String id_Teacher='';
  static List id_Subject_Add=[];
  static List id_Stud_Add=[];

  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;


  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width;
    screenHeight = _mediaQueryData?.size.height;
    blockSizeHorizontal = (screenWidth! / 100);
    blockSizeVertical = (screenHeight! / 100);
  }

}
