import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/colors.dart';
import 'package:project/CONSTANT/size_config.dart';
import 'package:project/project/Teacher/Controller/QuizeTeacher/QuizeTeacherScreenController.dart';
import '../../../Controller/question/QuestionController.dart';


class EditQuestionTeacherContent extends StatefulWidget {
  int?index;
  String ?a1;
  String ?a2;
  String ?a3;
  String ?a4;
  EditQuestionTeacherContent({this.index,this.a1,this.a2,this.a3,this.a4});
  // static const routeName = '/EditCat';
  @override
  _EditQuestionTeacherContentState createState() => _EditQuestionTeacherContentState();
}

class _EditQuestionTeacherContentState extends State<EditQuestionTeacherContent> {
  QuizeTeacherControllerScreen controllerr=Get.put(QuizeTeacherControllerScreen());
  QuestionTeacherController controller=Get.put(QuestionTeacherController());
  String? img;
  String? img1;
  String? img2;
  String? img3;
  String? nameeeeeeeee;
  Uint8List? selectedImageByte;
  final GlobalKey<FormState> formKey = GlobalKey();


  var text;
  List<String>    answertexts=['','','',''];
  List<String> answerImages=['','','',''];
  var correct_answer_symbol;
  var audio;
  var category_id=SizeConfig.id_Cat;



  @override
  Widget build(BuildContext context) {
    // print('jjjjjjjjjjjjjjjjjjjjjjjj${ controller.QuestioSeachert.values.elementAt(0).text
    //     }' );

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
                child:GetBuilder<QuestionTeacherController>(
                    builder: (controller)
                    {
                      return


                        Container(
                          height: 800,

                          child:ListView.builder(

                              itemCount:controller.QuestioSeachert.values.length!,
                              itemBuilder: (BuildContext ctx, index) {
                                return Container(
                                  height: 800,
                                  child: ListView.builder(

                                      itemCount:1,
                                      itemBuilder: (BuildContext ctx, i) {
                                          text=controller.QuestioSeachert.values.elementAt(0).text;
                                        correct_answer_symbol=controller.QuestioSeachert.values.elementAt(0).correct_Symbol;
                                        answertexts[0]=(controller.QuestioSeachert.values.elementAt(0).answers![0].text!);
                                        answertexts[1]=(controller.QuestioSeachert.values.elementAt(0).answers![1].text!);
                                        answertexts[2]=(controller.QuestioSeachert.values.elementAt(0).answers![2].text!);
                                        answertexts[3]=(controller.QuestioSeachert.values.elementAt(0).answers![3].text!);
                                        String a1=  controller.QuestioSeachert.values.elementAt(0).answers![0].imgName.toString();
                                     // File n= File("/data/user/0/com.example.project/cache/file_picker/${a1}");
                                          answerImages[0]=("/data/user/0/com.example.project/cache/file_picker/${a1}");
                                        String s2=controller.QuestioSeachert.values.elementAt(0).answers![1].imgName.toString();
                                          // File n1= File("/data/user/0/com.example.project/cache/file_picker/${s2}");
                                        answerImages[1]=("/data/user/0/com.example.project/cache/file_picker/${s2}");
                                        String a3=controller.QuestioSeachert.values.elementAt(0).answers![2].imgName.toString();
                                          // File n3= File("/data/user/0/com.example.project/cache/file_picker/${a3}");
                                        answerImages[2]=("/data/user/0/com.example.project/cache/file_picker/${a3}");
                                        String a4=controller.QuestioSeachert.values.elementAt(0).answers![3].imgName.toString();
                                          // File n4= File("/data/user/0/com.example.project/cache/file_picker/${a4}");
                                        answerImages[3]=("/data/user/0/com.example.project/cache/file_picker/${a4}");
print(answerImages);
                                        return
                Container(
                  height: 600,
                  child: ListView(
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

                                        hintText: (controller.QuestioSeachert.values.elementAt(0).text!=null)?controller.QuestioSeachert.values.elementAt(0).text:'',



                                      ),
                                      onSaved: (value) {
                                        if(value==''){
                                           value=controller.QuestioSeachert.values.elementAt(0).text;
                                           text = value;
                                        }else {
                                          text = value;
                                        }
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

hintText: (controller.QuestioSeachert.values.elementAt(0).correct_Symbol!=null)?controller.QuestioSeachert.values.elementAt(0).correct_Symbol:"",



                                      ),
                                      onSaved: (value) {
                                        if(value==''){
                                          value=controller.QuestioSeachert.values.elementAt(0).correct_Symbol!;
                                          correct_answer_symbol = value;
                                        }
else {
                                          correct_answer_symbol = value;
                                        }
                                        print(value);
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

hintText:  (controller.QuestioSeachert.values.elementAt(0).answers![0].text!=null)?controller.QuestioSeachert.values.elementAt(0).answers![0].text:"",
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black38, width: 2),

                                            ),


                                          ),
                                          onSaved: (value) {
                                            print(value);
                                            if(value==''){
                                              value=controller.QuestioSeachert.values.elementAt(0).answers![0].text!;
                                              answertexts[0]=(value!);
                                            }else {
                                              answertexts[0] = (value!);
                                            }




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
                                      ClipRect(
                                        child: Container(
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
                                          child:( img != null)
                                              ? InkWell(
                                            //  onTap: _selectFile,
                                              onTap: createfile,
                                              child:
                                              Image.file(File(img!))


                                            // Image.file(img!)
                                          )
                                              : InkWell(
                                            onTap:
                                              createfile,

                                            child: (controller.QuestioSeachert.values.elementAt(0).answers![0].img!=null)?
                                            Image.network("http://192.168.1.106/${controller.QuestioSeachert.values.elementAt(0).answers![0].img}",fit: BoxFit.fill,):Container(),
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

                                            hintText:  (controller.QuestioSeachert.values.elementAt(0).answers![1].text!=null)?controller.QuestioSeachert.values.elementAt(0).answers![1].text:"",
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black38, width: 2),

                                            ),


                                          ),
                                          onSaved: (value) {
                                            print(value);
                                            if(value==''){
                                              value=controller.QuestioSeachert.values.elementAt(0).answers![1].text!;
                                              answertexts[1]=(value!);
                                            }else {
                                              answertexts[1] = (value!);
                                            }
                                              // answertexts[1]=(value!);

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
                                      ClipRect(
                                        child: Container(
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
                                              Image.file(File(img1!))

                                            // Image.file(img!)
                                          )
                                              : InkWell(
                                            onTap: createfile1,
                                            child: (controller.QuestioSeachert.values.elementAt(0).answers![1].img!=null)?
                                            Image.network("http://192.168.1.106/${controller.QuestioSeachert.values.elementAt(0).answers![1].img}"):Container(),
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

                                            hintText:  (controller.QuestioSeachert.values.elementAt(0).answers![2].text!=null)?controller.QuestioSeachert.values.elementAt(0).answers![2].text:"",
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black38, width: 2),

                                            ),


                                          ),
                                          onSaved: (value) {
                                            print(value);
                                            if(value==''){
                                              value=controller.QuestioSeachert.values.elementAt(0).answers![2].text!;
                                              answertexts[2]=(value!);
                                            }else {
                                              answertexts[2] = (value!);
                                            }


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
                                      ClipRect(
                                        child: Container(
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
                                              Image.file(File(img2!))

                                            // Image.file(img!)
                                          )
                                              : InkWell(
                                            onTap: createfile2,
                                            child: (controller.QuestioSeachert.values.elementAt(0).answers![2].img!=null)?
                                            Image.network("http://192.168.1.106/${controller.QuestioSeachert.values.elementAt(0).answers![2].img}"):Container(),
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

                                            hintText:  (controller.QuestioSeachert.values.elementAt(0).answers![3].text!=null)?controller.QuestioSeachert.values.elementAt(0).answers![3].text:'',
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black38, width: 2),

                                            ),


                                          ),
                                          onSaved: (value) {
                                            print(value);
                                            if(value==''){
                                              value=controller.QuestioSeachert.values.elementAt(0).answers![3].text!;
                                              answertexts[3]=(value!);
                                            }else {
                                              answertexts[3] = (value!);
                                            }
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
                                      ClipRect(
                                        child: Container(
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
                                              Image.file(File(img3!))

                                            // Image.file(img!)
                                          )
                                              : InkWell(
                                            onTap: createfile3,
                                            child:  (controller.QuestioSeachert.values.elementAt(0).answers![3].img!=null)?
                                                Image.network("http://192.168.1.106/${controller.QuestioSeachert.values.elementAt(0).answers![3].img}"):Container(),

                                             
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
                            print(answerImages);
                            formKey.currentState!.save();
                            await controllerr.EditQ(text,answertexts,["/data/user/0/com.example.project/cache/file_picker/${widget.a1}","/data/user/0/com.example.project/cache/file_picker/${widget.a2}","/data/user/0/com.example.project/cache/file_picker/${widget.a3}","/data/user/0/com.example.project/cache/file_picker/${widget.a4}"],correct_answer_symbol,audio,category_id);


                        },
                      ),
                    ],
                  ),
                );

  }));}));
                        })

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
        img = file.path!;
        answerImages.add(img!);
        // answerImages.add(img!.path);
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
        img3 = file.path!;
        answerImages.add(img3!);
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
        img1= file.path!;
        answerImages.add(img1!);
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
        img2 = file.path!;
        answerImages.add(img2!);
        print("hhhhhhhhhhhhhhhhhhhhhhhhhh${answerImages}");
      });
    }
  }
}
















