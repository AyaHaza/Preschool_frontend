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
import 'package:project/CONSTANT/size_config.dart';
import 'package:project/project/Teacher/Controller/QuizeTeacher/QuizeTeacherScreenController.dart';
import 'package:project/project/Teacher/Controller/question/QuestionControllerScreen.dart';

import '../../../Controller/QuizeTeacher/QuizeTeacherController.dart';
class AddQuestionContent extends StatefulWidget {
  @override
  _AddQuestionContentState createState() => _AddQuestionContentState();
}

class _AddQuestionContentState extends State<AddQuestionContent> {
  QuizeTeacherControllerScreen controller = Get.find();
 // QuizeTeacherController controller1 = Get.find();
  File? img;
  File? img1;
  File? img2;
  File? img3;
  var name;
  String? nameeeeeeeee;
  Uint8List? selectedImageByte;
  final GlobalKey<FormState> formKey = GlobalKey();

  var text;
  List<String>    answertexts=[];
  List<String> answerImages=[];
  var correct_answer_symbol;
  var audio;
  var category_id=SizeConfig.id_Cat;
  @override
  Widget build(BuildContext context) {
print(answertexts);
    return Scaffold(
        appBar:AppBar(
          centerTitle: true,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 19),
          title:Text("Add Quize") ,
        ),

        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child:
                Column(
                  children: [
                    Wrap(
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        Row(

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Text Question :', style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15,),),
                            //   SizedBox(width: 20,),
                            Container(
                              width: 150,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  filled: true,

                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black38, width: 2),

                                  ),


                                ),
                                onSaved: (value) {
                                  text = value;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Row(

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Correct Answer :', style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15,),),
                            //   SizedBox(width: 20,),
                            Container(
                              width: 150,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  filled: true,

                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black38, width: 2),

                                  ),


                                ),
                                onSaved: (value) {
                                  correct_answer_symbol = value;
                                  print(correct_answer_symbol);
                                },
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 40.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text('opTion :', style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15,),),
                                SizedBox(height: 10.h,),
                                Container(
                                  width: 150,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      filled: true,

                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black38, width: 2),

                                      ),


                                    ),
                                    onSaved: (value) {
                                      print(value);
                                      answertexts.add(value!);
                                      print(answertexts);
                                    },
                                  ),
                                ),

                              ],
                            ),

                            Column(
                              children: [
                                Text('Image :', style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15,),),
SizedBox(height: 10.h,),
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(

                                    border: Border.all(
                                        color: AppColors.barBg,
                                        width: 2.0,
                                        style: BorderStyle.solid),
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
                                        Text('Add Image '),
                                        Icon(Icons.add_a_photo)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                        ,
                        SizedBox(
                          height: 40.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text('opTion :', style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15,),),
                                SizedBox(height: 10.h,),
                                Container(
                                  width: 150,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      filled: true,

                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black38, width: 2),

                                      ),


                                    ),
                                    onSaved: (value) {
                                      print(value);
                                      answertexts.add(value!);
                                      print(answertexts);
                                    },
                                  ),
                                ),

                              ],
                            ),

                            Column(
                              children: [
                                Text('Image :', style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15,),),
                                SizedBox(height: 10.h,),
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(

                                    border: Border.all(
                                        color: AppColors.barBg,
                                        width: 2.0,
                                        style: BorderStyle.solid),
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  //     color: Colors.amber,
                                  child: img1 != null
                                      ? InkWell(
                                    //  onTap: _selectFile,
                                      onTap: createfile1,
                                      child:
                                      Image.file(img1!)

                                    // Image.file(img!)
                                  )
                                      : InkWell(
                                    onTap: createfile1,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text('Add Image '),
                                        Icon(Icons.add_a_photo)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                        ,
                        SizedBox(
                          height: 40.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text('opTion :', style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15,),),
                                SizedBox(height: 10.h,),
                                Container(
                                  width: 150,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      filled: true,

                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black38, width: 2),

                                      ),


                                    ),
                                    onSaved: (value) {
                                      print(value);
                                      answertexts.add(value!);
                                      print(answertexts);
                                    },
                                  ),
                                ),

                              ],
                            ),

                            Column(
                              children: [
                                Text('Image :', style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15,),),
                                SizedBox(height: 10.h,),
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(

                                    border: Border.all(
                                        color: AppColors.barBg,
                                        width: 2.0,
                                        style: BorderStyle.solid),
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  //     color: Colors.amber,
                                  child: img2 != null
                                      ? InkWell(
                                    //  onTap: _selectFile,
                                      onTap: createfile2,
                                      child:
                                      Image.file(img2!)

                                    // Image.file(img!)
                                  )
                                      : InkWell(
                                    onTap: createfile2,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text('Add Image '),
                                        Icon(Icons.add_a_photo)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                        ,
                        SizedBox(
                          height: 40.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text('opTion :', style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15,),),
                                SizedBox(height: 10.h,),
                                Container(
                                  width: 150,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      filled: true,

                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black38, width: 2),

                                      ),


                                    ),
                                    onSaved: (value) {
                                      print(value);
                                     answertexts.add(value!);
                                    },
                                  ),
                                ),

                              ],
                            ),

                            Column(
                              children: [
                                Text('Image :', style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15,),),
                                SizedBox(height: 10.h,),
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(

                                    border: Border.all(
                                        color: AppColors.barBg,
                                        width: 2.0,
                                        style: BorderStyle.solid),
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  //     color: Colors.amber,
                                  child: img3 != null
                                      ? InkWell(
                                    //  onTap: _selectFile,
                                      onTap: createfile3,
                                      child:
                                      Image.file(img3!)

                                    // Image.file(img!)
                                  )
                                      : InkWell(
                                    onTap: createfile3,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text('Add Image '),
                                        Icon(Icons.add_a_photo)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                        ,
                        SizedBox(
                          height: 40.h,
                        ),



                      ],
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),),
                      color: Colors.teal.withOpacity(0.4) ,
                      child: Text('  Add  '),
                      onPressed: ()async {
                        print(answertexts);
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        formKey.currentState!.save();
                        print(answertexts);
                        await controller.uploadQ(text,answertexts,answerImages,correct_answer_symbol,audio,category_id);


                      },
                    ),
                  ],
                ),


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
        answerImages.add(img!.path);
        print("hhhhhhhhhhhhhhhhhhhhhhhhhh${answerImages}");
      });
    }
  }
  void createfile3() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );
    if (resultFile != null) {
      PlatformFile file = resultFile.files.first;
      print(file.path);
      setState(() {
        img3 = File(file.path!);
        answerImages.add(img3!.path);
        print("hhhhhhhhhhhhhhhhhhhhhhhhhh${answerImages}");
      });
    }
  }
  void createfile1() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );
    if (resultFile != null) {
      PlatformFile file = resultFile.files.first;
      print(file.path);
      setState(() {
        img1= File(file.path!);
        answerImages.add(img1!.path);
        print("hhhhhhhhhhhhhhhhhhhhhhhhhh${answerImages}");
      });
    }
  }
  void createfile2() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );
    if (resultFile != null) {
      PlatformFile file = resultFile.files.first;
      print(file.path);
      setState(() {
        img2 = File(file.path!);
        answerImages.add(img2!.path);
        print("hhhhhhhhhhhhhhhhhhhhhhhhhh${answerImages}");
      });
    }
  }
}