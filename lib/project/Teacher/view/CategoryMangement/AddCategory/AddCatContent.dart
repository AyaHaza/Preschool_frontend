import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project/CONSTANT/colors.dart';
// import 'dart:io';
import '../../../Controller/Categories/catScreenControlleer.dart';
import '../AllCategory/AllCategory.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
class AddCatContent extends StatefulWidget {
  @override
  _AddCatContentState createState() => _AddCatContentState();
}

class _AddCatContentState extends State<AddCatContent> {
  catControllerScreen controller = Get.find();
  File? img;
  var name;
  String? nameeeeeeeee;
  Uint8List? selectedImageByte;
  final GlobalKey<FormState> formKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          centerTitle: true,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 19),
          title:Text("Add Category") ,
        ),

        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //    SizedBox(height: 100,),
                  Form(
                    key: formKey,
                    child:
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Name Category Quize :', style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15,),),
                        //   SizedBox(width: 20,),
                        Container(
                          width: 200,
                          child: TextFormField(
                            decoration: InputDecoration(

                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.shade100, width: 2),

                              ),


                            ),
                            onSaved: (value) {
                              name = value;
                            },
                          ),
                        ),
                      ],
                    ),


                  ),

                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Image Category Quize :', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15,),),

                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          // boxShadow: const [
                          //   AppColors.shadowWidget //BoxShadow
                          // ],
                          // border: Border.all(
                          //     color: Colors.black87,
                          //     width: 1.0,
                          //     style: BorderStyle.solid),
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        //     color: Colors.amber,
                        child: img != null
                            ? InkWell(
                          //  onTap: _selectFile,
                            onTap: createfile,
                            child:
                            Image.file(img!)

                          // Image.file(img!)
                        )
                            : InkWell(
                          onTap: createfile,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Text('Add Image ',style: TextStyle(color: Colors.grey.shade500,),),
                              Icon(Icons.add_a_photo)
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                  ,
                  SizedBox(
                    height: 40.h,
                  ),
                  MaterialButton(

                    color: Colors.grey.shade300 ,
                    child: Text('  Add  '),
                    onPressed: ()async {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      formKey.currentState!.save();
                      print(name);
                      print(img);
                     await controller.upload(name,img);


                    },
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                ],
              ),
            ),
          ),
        ));
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
  }
}