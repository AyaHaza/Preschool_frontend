import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/CONSTANT/responsive.dart';
import '../../Controller/Authentication/AuthController.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'ProfileFormEdit.dart';

class ProfileEdit extends StatefulWidget {
  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  double x=300.h;
  double y=50.w;
  AuthController auth =Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900.h,
      child: Stack(
        children: [


          Positioned(
            top:(!Responsive.isMobile(context)) ? x+100 :0,
            left: y+5.w,
            child: Container(
              width: 190.w,
              height: 50.h,
              child: ElevatedButton.icon(
                // <-- ElevatedButton
                onPressed: () async => await auth.uploadImage(),
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.black87,
                ),
                icon: Icon(
                  Icons.camera_alt,
                  size: 24.0.sp,
                  color: Colors.white,
                ),

                label: Text(
                  'Upload',
                  style: TextStyle(color: Colors.white,fontSize: 20.sp),
                ),
              ),
            ),
          ),
          if(!Responsive.isMobile(context))
            GetBuilder<AuthController>(
              builder: (controller) =>
                  Positioned(
                    top:x-90,
                    left: y+50.w,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50.w,
                          backgroundImage: controller.user!.photo !=null? Image.network(controller.user!.photo!).image  :ExactAssetImage("images/profile.jpg") as ImageProvider,
                          foregroundColor: Colors.white,
                        ),
                        SizedBox(height: 10.h,),
                        Text("role: ${controller.user!.role} ",style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ), //CircularAvatar
                  ),
            ),
          Positioned(
              top: x-200.h,
              left: 300.w,
              child: ProfileEditForm())
        ],
      ),
    );
  }
}

class Customshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double hight = size.height;
    double width = size.width;
    path.lineTo(0, hight - 100);
    path.quadraticBezierTo(width / 2, hight, width, hight - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
