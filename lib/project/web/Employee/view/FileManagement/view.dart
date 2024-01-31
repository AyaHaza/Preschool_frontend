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
          ElevatedButton.icon(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.black)),
            onPressed: () => add(),
            icon: Icon(Icons.add_link_outlined),
            label: Text('Add File'),
          ),
          SizedBox(
            height: 50.h,
          ),
          Container(
            width: 900.w,
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
              return SizedBox(
                height: 80.h,
                child: Card(
                  elevation: 2,
                  margin: EdgeInsets.all(3.w),
                  child: ListTile(
                    onTap: (){
                      controller.open(position);
                    },
                    hoverColor:Colors.black.withOpacity(0.05),
                    leading: Icon(
                      Icons.file_present_outlined,
                      size: 30,
                      color: Color.fromRGBO(10, 158, 220, 1.0),
                    ),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[ Padding(
                        padding:  EdgeInsets.only(top: 12.h),
                        child: Text(controller2.Files.values.elementAt(position)!.name!,style: TextStyle(fontWeight: FontWeight.bold),),
                      ),

                        SizedBox(
                          // height: 40.h,
                          child: ButtonBar(
                            children: <Widget>[
                              SizedBox(
                                height:25.h,
                                child: ElevatedButton(

                                  style: ButtonStyle(

                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue),
                                      overlayColor: MaterialStateProperty.all<Color>(
                                          Colors.white24.withOpacity(0.4))
                                  ),
                                  child: Text(controller2.Files.values.elementAt(position)!.status!),
                                  onPressed: () {
                                    controller2.UpdateStatus(position);
                                  },
                                ),
                              ),
                              SizedBox(
                                height:25.h,

                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red),
                                      overlayColor: MaterialStateProperty.all<Color>(
                                          Colors.white24.withOpacity(0.4))
                                  ),
                                  child: Text('Delete'),
                                  onPressed: () {
                                    controller2.Delete(position);

                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                      ]
                    ),
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

  void add() async {
    Get.defaultDialog(
      title: "Add file",
      content: GetBuilder<FileControllerScreen>(
        builder: (controller1) => Container(
          child: Center(
            child: controller1.isLoading
                ? SizedBox(
                    height: 30.h,
                    width: 30.w,
                    child:  CircularProgressIndicator(),
                  )
                : SizedBox(
                    height: 50.h,
                    width: 500.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        ElevatedButton.icon(
                          style: ButtonStyle(elevation :MaterialStateProperty.all<double>(0),backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),

                          icon: Icon(Icons.link_rounded),
                          onPressed: () async {
                            await uploadFile();
                            controller.updateload(false);

                          },
                          label: Text("choose file"),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      titleStyle: TextStyle(color: Colors.grey, fontSize: 24.sp),
      middleTextStyle: TextStyle(color: Colors.grey),
      cancelTextColor: Colors.white,
      buttonColor: Colors.white30,
      barrierDismissible: true,
      radius: 0,
      actions: <Widget>[
        SizedBox(
          height: 50.h,
          child: ElevatedButton(
             style: ButtonStyle(elevation :MaterialStateProperty.all<double>(0),backgroundColor: MaterialStateProperty.all<Color>(Colors.black.withOpacity(0))),
            child: Text("No",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 23.sp),),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        SizedBox(
          height: 50.h,
          child: ElevatedButton(
              child: Text("Yes",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 23.sp),),

              style: ButtonStyle(elevation :MaterialStateProperty.all<double>(0),backgroundColor: MaterialStateProperty.all<Color>(Colors.black.withOpacity(0))),
              onPressed: () {
                if(upload==false)
                  {
                    Dialogs.Error("filw not supported");
                    return;
                  }
                controller.Store();

              }),
        )
      ],
    );
  }

  Future<void> uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [ 'jpg', 'png','pdf','txt', 'doc','ppt','pptx','docx','gif','jar','mp4','mp3'],
    );

    if (result != null &&
        ['jpg', 'png','pdf', 'doc','ppt','pptx','docx','gif','jar','mp4','mp3','txt'].contains(result.files.single.extension)) {
      controller.files.clear();
      controller.updateload(true);
      result.files.forEach((element) async {
       controller.files.add(File(name:element.name,uploadfile: element.bytes,extention: element.extension ));
        upload = true;

      });
          }else {
      upload=false;
      // User canceled the picker
    }
  }
}
