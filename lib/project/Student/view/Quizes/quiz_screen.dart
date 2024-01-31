import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:project/project/Test/const/text_style.dart';
import '../../Controller/QuizeSytudent/QSController.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Controller/QuizeSytudent/QSScreenController.dart';
class QuizScreen extends StatefulWidget {
static const routeName = '/Quizeeeeeeeeee';
int?id;
QuizScreen({this.id});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
    QSController controller = Get.find();
 QSControllerScreen controllerr = Get.find();
final player = AudioPlayer();
late Source audioUrl;
  var currentQuestionIndex = 0;
  int seconds = 60;
  Timer? timer;


  int points = 0;

  var isLoaded = false;

  var optionsList = [];

  var optionsColor = [
     Colors.teal,
      Colors.teal,
      Colors.teal,
      Colors.teal,
      Colors.teal,
  ];

  @override
  void initState() {
    super.initState();
//controller.Fetch(widget.id);

    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  resetColors() {
    optionsColor = [
      Colors.teal,
      Colors.teal,
      Colors.teal,
      Colors.teal,
      Colors.teal,
    ];
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          gotoNextQuestion();
        }
      });
    });
  }

  gotoNextQuestion() {
    isLoaded = false;
    currentQuestionIndex++;
    resetColors();
    timer!.cancel();
    seconds = 60;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

   final double itemHeight = (size.height - kToolbarHeight) / 4
    ;
    final double itemWidth = size.width / 2;
    return Scaffold(
        appBar:AppBar(
          centerTitle: true,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 19),
          title:Text("Quize") ,
        ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          ),
        child: GetBuilder<QSController>(
                  builder: (controller)
                  {  //  var data =controller.QuizeSt.values ;
              print('dddddddddddddddddddddddddddddddddddddd${controller.QuizeSt.values}');

              // if (isLoaded == false) {
              //   optionsList = data.elementAt(currentQuestionIndex).answers as List<dynamic>;
              // //  optionsList = data[currentQuestionIndex]["incorrect_answers"];
              //   // optionsList.add(data[currentQuestionIndex]["correct_answer"]);
              //   optionsList.shuffle();
              //   isLoaded = true;
              // }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Stack(
                          alignment: Alignment.center,
                          children: [
                            normalText(color: Colors.black, size: 24, text: "$seconds"),
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: CircularProgressIndicator(
                                value: seconds / 60,
                                valueColor: const AlwaysStoppedAnimation(Colors.teal),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.teal, width: 2),
                          ),
                          child: TextButton.icon(
                              onPressed:()async{
                            audioUrl=await UrlSource("${AuthNetwork.base}/"+'${controller.QuizeSt.values.elementAt(currentQuestionIndex).audio}');
                           //     player.paly(audioUrl);
                                await player.play(audioUrl);
                             //   player.mode.
                              } ,
                              icon: const Icon(CupertinoIcons.music_note_2, color: Colors.teal, size: 18),
                              label: normalText(color: Colors.black, size: 14, text: "Sound")),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  //  Image.network('http://192.168.1.103:80/'+'${data.elementAt(currentQuestionIndex).audio}',),
                    const SizedBox(height: 20),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: normalText(
                            color: Colors.grey,
                            size: 18,
                            text: "Question ${currentQuestionIndex + 1} of ${controller.QuizeSt.values.length}")),
                    const SizedBox(height: 20),
                    normalText(color: Colors.black, size: 20, text: controller.QuizeSt.values.elementAt(currentQuestionIndex).text),
                    const SizedBox(height: 20),
                    GridView.builder(

                             gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                               //  crossAxisCount: 2,

                   childAspectRatio: (itemWidth / itemHeight),
                   crossAxisSpacing: 10,
                   mainAxisSpacing: 10, maxCrossAxisExtent: 200,
                             ),
                      shrinkWrap: true,
                      itemCount: controller.QuizeSt.values.elementAt(currentQuestionIndex).answers!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var answer = controller.QuizeSt.values.elementAt(currentQuestionIndex).correctAnswerText;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (answer.toString() == controller.QuizeSt.values.elementAt(currentQuestionIndex).answers![index].text.toString()) {
                                optionsColor[index] = Colors.green;
                                points = points + 10;
                              } else {
                                optionsColor[index] = Colors.red;
                              }

                              if (currentQuestionIndex < controller.QuizeSt.values.length - 1) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  gotoNextQuestion();
                                });
                              } else {
                                timer!.cancel();
                                //here you can do whatever you want with the results
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            alignment: Alignment.center,
                            width: size.width - 100,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: optionsColor[index],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child:Row(children: [
                               headingText(
                              color: Colors.black,
                              size: 18,
                              text: controller.QuizeSt.values.elementAt(currentQuestionIndex).answers![index].text.toString(),
                            ),
                            Image.network("${AuthNetwork.base}/"+'${controller.QuizeSt.values.elementAt(currentQuestionIndex).answers![index].img.toString()}',),

                            ],)
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
          }

      )),
    ));
  }
}
