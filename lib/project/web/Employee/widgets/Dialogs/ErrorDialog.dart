import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../../../../CONSTANT/size_config.dart';
import '../../view/Classes/fromDialodUnStudent.dart';
import '../../Controller/Authentication/AuthController.dart';
class Dialogs {
  static AuthController auth = Get.find();

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



  static void InfoClass(String title, Widget widget) {
    Get.defaultDialog(
        title: title,
        content: SizedBox(width:700.w,child: Container(child: widget,color:  Color(0XFFF5F5F5))),
        backgroundColor: Colors.white,
        titleStyle: TextStyle(color: Colors.black),
        middleTextStyle: TextStyle(color: Colors.grey),
        textConfirm: "Add Student To Class",
        cancelTextColor: Colors.white,
        buttonColor:  Color(0XFFF5F5F5),
        barrierDismissible: true,
        radius: 10,
        onConfirm: () async{
          await   Get.defaultDialog(
            title: "Choose Student To Add",
            content: SizedBox(width:500.w,child: Container(child: unStudentclassdialogDetail(),color:  Color(0XFFF5F5F5))),
            backgroundColor: Colors.white,
            titleStyle: TextStyle(color: Colors.black),
            middleTextStyle: TextStyle(color: Colors.grey),
            textConfirm: "Add ",
            cancelTextColor: Colors.white,
            buttonColor:  Color(0XFFF5F5F5),
            barrierDismissible: true,
            radius: 10,
            onConfirm: () {
              blukCheckIn(SizeConfig.id_Stud_Add);
              Get.back();

            },
          );
          Get.back();
          //   Get.offNamed(page);
        }

    );
  }
  static void InfoAddTecherClassest(String title, Widget widget) {
    Get.defaultDialog(
        title: title,
        content: SizedBox(width:300.w,child: Container(child: widget,color:  Color(0XFFF5F5F5))),
        backgroundColor: Colors.white,
        titleStyle: TextStyle(color: Colors.black),
        middleTextStyle: TextStyle(color: Colors.grey),
        textConfirm: "Ok",
        cancelTextColor: Colors.white,
        buttonColor:  Color(0XFFF5F5F5),
        barrierDismissible: true,
        radius: 10,
        onConfirm: () async{

          Get.back();
        }

    );
  }

  static void InfoAddTecherStudent(String title, Widget widget) {
    Get.defaultDialog(
        title: title,
        content: SizedBox(width:400.w,child: Container(child: widget,color:  Color(0XFFF5F5F5))),
        backgroundColor: Colors.white,
        titleStyle: TextStyle(color: Colors.black),
        middleTextStyle: TextStyle(color: Colors.grey),
        textConfirm: "Add Subject To Class",
        cancelTextColor: Colors.white,
        buttonColor:  Color(0XFFF5F5F5),
        barrierDismissible: true,
        radius: 10,
        onConfirm: () async{
          await blukCheckInSubject(SizeConfig.id_Subject_Add);

          Get.back();
          //   Get.offNamed(page);
        }

    );
  }
}
Future<void> blukCheckIn(selectedFiles) async {
   AuthController auth = Get.find();

  var url = Uri.parse('${AuthNetwork.baseUrl}/assign/student/${SizeConfig.id_Class}');
  if(selectedFiles.length>0){
    for(var i=0;i<selectedFiles.length;i++){
      http.Response response = await http.post(
          url,
          headers: {
            'accept': 'application/json',
            "Authorization": "Bearer ${auth.user!.token}"
          },
          body: {
            'students[${i}]':selectedFiles[i].toString(),
          }
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        print(response.body);

        // // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        // //   return myFiles();
        // }));
        // Navigator.pop(context);

      } else {
        print(response.body);
        //   print("Error in internet....");
      }
    }
  }



}


Future<void> blukCheckInSubject(selectedFiles) async {
   AuthController auth = Get.find();

  var url = Uri.parse('${AuthNetwork.baseUrl}/assign/teacher');
  if(selectedFiles.length>0){
    for(var i=0;i<selectedFiles.length;i++){
      http.Response response = await http.post(
          url,
          headers: {
            'accept': 'application/json',
            "Authorization": "Bearer ${auth.user!.token}"
          },
          body: {
            'subjects[${i}]':selectedFiles[i].toString(),
            'class_id':SizeConfig.id_ClassSub,
            'teacher_id':SizeConfig.id_Teacher,

          }
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        print(response.body);

        // // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        // //   return myFiles();
        // }));
        // Navigator.pop(context);

      } else {
        print(response.body);
        //   print("Error in internet....");
      }
    }
  }



}
