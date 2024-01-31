

// import 'dart:async';

// import 'package:get/get.dart';
// import 'package:pre_school_project/project/mobile/Controller/QuizeSytudent/QuizeTeacherScreenController.dart';

// import '../mobile/Controller/QuizeSytudent/QuizeTeacherController.dart';
// import 'api_services.dart';
// import 'const/colors.dart';
// import 'const/images.dart';
// import 'const/text_style.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class QuizScreen extends StatefulWidget {
//    static const routeName = '/Quizeeeeeeeeee';

//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
  
//  QSController controller = Get.find();
//  QSControllerScreen controllerr = Get.find();
//   var currentQuestionIndex = 0;
//   int seconds = 60;
//   Timer? timer;
 
//   int points = 0;

//   var isLoaded = false;

//   var optionsColor = [
//     Colors.white,
//     Colors.white,
//     Colors.white,
//     Colors.white,
//     Colors.white,
//   ];
//  late Future quiz;
//    @override
//   void initState() {
//     super.initState();
//     quiz = controller.Fetch();
//     startTimer();
//   }

//   @override
//   void dispose() {
//     timer!.cancel();
//     super.dispose();
//   }

//   resetColors() {
//     optionsColor = [
//       Colors.white,
//       Colors.white,
//       Colors.white,
//       Colors.white,
//       Colors.white,
//     ];
//   }

//   startTimer() {
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (seconds > 0) {
//           seconds--;
//         } else {
//           gotoNextQuestion();
//         }
//       });
//     });
//   }

//   gotoNextQuestion() {
//     isLoaded = false;
//     currentQuestionIndex++;
//     resetColors();
//     timer!.cancel();
//     seconds = 60;
//     startTimer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     // if (isLoaded == false) {data[currentQuestionIndex]["incorrect_answers"]
//     //             optionsList =controller.QuizeSt.values.elementAt(index).answers ;
//     //             optionsList.add(data[currentQuestionIndex]["correct_answer"]);
//     //             optionsList.shuffle();
//     //             isLoaded = true;
//     //           }

            
//     return Scaffold(
      
//       body: SafeArea(
//           child: Container(
//         width: double.infinity,
//         height: double.infinity,
//         padding: const EdgeInsets.all(12),
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [blue, darkBlue],
//         )),
//         child: GetBuilder<QSController>(
//                   builder: (controller) =>
//               SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50),
//                             border: Border.all(color: lightgrey, width: 2),
//                           ),
//                           child: IconButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               icon: const Icon(
//                                 CupertinoIcons.xmark,
//                                 color: Colors.white,
//                                 size: 28,
//                               )),
//                         ),
//                         Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             normalText(color: Colors.white, size: 24, text: "$seconds"),
//                             SizedBox(
//                               width: 80,
//                               height: 80,
//                               child: CircularProgressIndicator(
//                                 value: seconds / 60,
//                                 valueColor: const AlwaysStoppedAnimation(Colors.white),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(16),
//                             border: Border.all(color: lightgrey, width: 2),
//                           ),
//                           child: TextButton.icon(
//                               onPressed: null,
//                               icon: const Icon(CupertinoIcons.heart_fill, color: Colors.white, size: 18),
//                               label: normalText(color: Colors.white, size: 14, text: "Like")),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Image.asset(ideas, width: 200),
//                     const SizedBox(height: 20),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: normalText(
//                             color: lightgrey,
//                             size: 18,
//                             text: "Question ${currentQuestionIndex + 1} of ${controller.QuizeSt.values.length}")),
//                     const SizedBox(height: 20),
//                             Text('${controller.QuizeSt.values.elementAt(currentQuestionIndex).text}'),
//                     const SizedBox(height: 20),
                    
//                     ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: controller.QuizeSt.values.first.answers!.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         var answer = controller.QuizeSt.values.elementAt(currentQuestionIndex).correctAnswerText;

//                         return Column(
//                           children: [
//                              GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               if (answer.toString() == controller.QuizeSt.values.elementAt(currentQuestionIndex).answers![index].text.toString()) {
//                                 optionsColor[index] = Colors.green;
//                                 points = points + 10;
//                               } else {
//                                 optionsColor[index] = Colors.red;
//                               }

//                               if (currentQuestionIndex <= controller.QuizeSt.values.length - 1) {
//                                 Future.delayed(const Duration(seconds: 1), () {
//                                   gotoNextQuestion();
//                                 });
//                               } else {
//                                 timer!.cancel();
//                                 //here you can do whatever you want with the results
//                               }
//                             }
//                             );
//                           },
//                           child: Container(
//                             margin: const EdgeInsets.only(bottom: 20),
//                             alignment: Alignment.center,
//                             width: size.width - 100,
//                             padding: const EdgeInsets.all(16),
//                             decoration: BoxDecoration(
//                               color: optionsColor[index],
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: headingText(
//                               color: blue,
//                               size: 18,
//                               text: controller.QuizeSt.values.elementAt(0).answers![index].text.toString(),
//                             ),
//                           ),
//                         )
                      
//                             ],
//                         );
                        
                      
//                       },
//                     ),
//                   ],
//                 ),
//               )
//         )
//       )),
//     );
//   }
// }