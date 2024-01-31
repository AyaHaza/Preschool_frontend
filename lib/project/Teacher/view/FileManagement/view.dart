import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Controller/FileManagement/FileController.dart';
import '../../Controller/FileManagement/FileControllerScreen.dart';
import '../../widgets/EditPage/InputDecoration.dart';
import '../../widgets/EditPage/TextField.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import '../../Model/File.dart';
class content extends StatefulWidget {
  @override
  State<content> createState() => _contentState();
}

class _contentState extends State<content> {
  FileControllerScreen controller = Get.find();
  bool upload=false;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height:10.h),
          Container(
            width: 400.w,
            child: FutureBuilder(
      future: controller.controller.Fetch(),
      builder: (ctx, authResultSnapshot) =>
      authResultSnapshot.connectionState ==
      ConnectionState.waiting
      ? const Center(child: CircularProgressIndicator())
          : GetBuilder<FileController>(
        builder: (controller2) => ListView.builder(
            shrinkWrap: true,
            itemCount: controller2.Files.length,
            itemBuilder: (BuildContext context, int position) {
              return Card(
                // elevation: 3,
                margin: EdgeInsets.all(3.w),
                child: ListTile(
                  onTap: (){
                    controller.open(position);
                  },
                  hoverColor:Colors.black.withOpacity(0.1),
                  leading: Icon(
                    Icons.link_sharp,
                    size: 30,
                    color: Colors.blueAccent,
                  ),
                  title: Padding(
                    padding:  EdgeInsets.only(top: 10.h),
                    child: Text(controller2.Files.values.elementAt(position)!.name!,style: TextStyle(color:Colors.black.withOpacity(0.5),fontSize: 13.sp,fontWeight: FontWeight.bold),),
                  ),

                ),

              );
            }),
          )
      ),
          ),
        ],
      ),
    );
  }

}
