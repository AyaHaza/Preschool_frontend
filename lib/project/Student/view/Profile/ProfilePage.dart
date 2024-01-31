import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/project/Teacher/Service/Authentication/AuthNetwork.dart';

import '../../Controller/Authentication/AuthController.dart';
import '../Template.dart';
import 'ProfileFormEdit.dart';

class ProrfilePage extends StatefulWidget {
  static const routeName = '/Profile';

  @override
  State<ProrfilePage> createState() => _ProrfilePageState();
}

class _ProrfilePageState extends State<ProrfilePage> {
  AuthController controller  =Get.find();

  File? img;

  @override
  Widget build(BuildContext context) {
    return Template(
      title: "Profile",
        body: Stack(children: [

      GetBuilder<AuthController>(
        builder: (controller) => Positioned(
          top: 30.h,
          left: (MediaQuery.of(context).size.width / 2) - 65.w,
          child:CircleAvatar(
              radius: 70.w,
              backgroundImage: img != null
                  ?Image.file(img!).image
                  : controller.user!.photo!=null? Image.network('${AuthNetwork.base}'+'/${controller.user!.photo!}').image
                  :ExactAssetImage("images/profile.jpg")
            //ExactAssetImage("images/profile.jpg") as ImageProvider,
          ), //CircularAvatar
        ),
      ),
      Positioned(
          top: 100.h,
          left: (MediaQuery.of(context).size.width / 2) + 30.w,
          height: 30.h,
          width: 30.h,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(180)),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    createfile();
                  },
                  icon: Icon(
                    Icons.add_a_photo,
                    color: Colors.grey,
                  ),
                ),
              ))),
      Positioned.fill(
          top: 120.h,
          child: Container(
            child: ProfileEditForm(),
          ))
    ]));
  }

  void createfile() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );
    if (resultFile != null) {
      PlatformFile file = resultFile.files.first;
      print(file.path);
      setState(() {
        img = File(file.path!);

      });
    }
    await controller.upload(img,controller.user!.id!);
  }
}
