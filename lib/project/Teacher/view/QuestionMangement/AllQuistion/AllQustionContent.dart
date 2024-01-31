import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:project/CONSTANT/colors.dart';
import 'package:project/CONSTANT/size_config.dart';
import 'package:project/project/Teacher/Controller/question/QuestionController.dart';
import '../../../Controller/QuizeTeacher/QuizeTeacherController.dart';
import '../../../Controller/QuizeTeacher/QuizeTeacherScreenController.dart';
import '../AddQuestion/AddQuestion.dart';
import '../EditQuistion/EditQustion.dart';


class QuizScreen extends StatefulWidget {


  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuizeTeacherController controller = Get.put(QuizeTeacherController());

  QuestionTeacherController controllerr=Get.put(QuestionTeacherController());
  final player = AudioPlayer();
  late Source audioUrl;

  final GlobalKey<FormState> formKey = GlobalKey();


  List<String> answerImages=['','','',''];

  String ?a1='';
  String ?a2='';
  String ?a3='';
  String ?a4='';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 19),
        title:Text("Quizes") ,
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal.withOpacity(0.4) ,
          onPressed: ()async {

            await Get.toNamed(AddQiuestion.routeName);
            //Get.back();



          },
          child: Icon(Icons.add,color: AppColors.white,),
        ),

        body:
        Column(
          children: [
            Container(
              height: 0,
              child: GetBuilder<QuestionTeacherController>(
                  builder: (controller)
                  {
                    return


                      Container(
                          height: 0,

                          child:ListView.builder(

                              itemCount:controller.QuestioSeachert.values.length!,
                              itemBuilder: (BuildContext ctx, index) {
                                return Container(
                                    height: 0,
                                    child: ListView.builder(

                                        itemCount:1,
                                        itemBuilder: (BuildContext ctx, i) {
                                          (controller.QuestioSeachert.values.elementAt(0).answers![0].imgName.toString()!=null)?
                                            a1 = controller.QuestioSeachert
                                                .values
                                                .elementAt(0)
                                                .answers![0].imgName.toString():a1='';
                                            a2 = controller.QuestioSeachert
                                                .values
                                                .elementAt(0)
                                                .answers![1].imgName.toString();
                                            a3 = controller.QuestioSeachert
                                                .values
                                                .elementAt(0)
                                                .answers![2].imgName.toString();
                                            a4 = controller.QuestioSeachert
                                                .values
                                                .elementAt(0)
                                                .answers![3].imgName.toString();
print(a2);print(a1);
                                          return
                                            Container();

                                        }));}));
                  }),
            ),

            Expanded(
              child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
              ),
          child: GetBuilder<QuizeTeacherController>(
                        builder: (controller)
                        {
                    print('dddddddddddddddddddddddddddddddddddddd${controller.QuizeSt.values}');

print(controller.QuizeSt.values.length);
                    return


                              ListView.builder(

                                  itemCount:controller.QuizeSt.values.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    print('dddddddddddddddddddddddddmmmmmmmmmmmmmmmmmmmmmmmmddddddddddd${controller.QuizeSt.values}');

                                    print(controller.QuizeSt.values.length);
                                    return Card(
                                      child: ListTile(
                                        title: Text('${controller.QuizeSt.values.elementAt(index).text}'),
                                        subtitle: Text('${controller.QuizeSt.values.elementAt(index).correctAnswerText}'),
                                        trailing:Container(
                                          width: 120,
                                          child: Row(
                                            //crossAxisAlignment: CrossAxisAlignment.end,
                                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton( onPressed:()async{
                                                audioUrl=await UrlSource('http://192.168.1.103:80/'+'${controller.QuizeSt.values.elementAt(index).audio}');
                                                //     player.paly(audioUrl);
                                                await player.play(audioUrl);
                                                //   player.mode.
                                              },
                                                icon: Icon(Icons.music_note),),
                                              IconButton(onPressed: (){
                                                SizeConfig.id_question=controller.QuizeSt.values.elementAt(index).id!.toString();
                                                print('object ${controller.QuizeSt.values.elementAt(index).id!}');

                                                Get.to(()=>EditQuestionTeacher(index:index,a1:a1,a2:a2,a3:a3,a4:a4));
                                              },
                                                icon: Icon(Icons.edit,color: Color(0XFF58C294)),),
                                              Expanded(
                                                child:   IconButton(
                                                    onPressed: () async{

                                                      await  Get.defaultDialog(
                                                        title: 'Are You Sure Delete Question ${controller.QuizeSt.values.elementAt(index).text!} ',
                                                        buttonColor: AppColors.delete,
                                                        confirmTextColor: AppColors.white,
                                                        cancelTextColor: AppColors.delete,
                                                        textConfirm: 'yes',
                                                        textCancel: 'no',
                                                        onConfirm: ()async {
                                                          Get.back();
                                                          await  controller.Delete(controller.QuizeSt.values.elementAt(index).id!);
                                                          // Get.back();
                                                        },
                                                      );

                                                    },
                                                    icon: Icon(
                                                      Icons.delete,
                                                      color: Color(0XFFED5A48),
                                                      size: 20,
                                                    ))  ),
                                            ],
                                          ),
                                        )
                                      ),
                                    );
                                  });
                            })
                    ),
            ),
                ],
        )


    );
  }
}
