import 'package:get/get.dart';


import 'quiz_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuizApp extends StatelessWidget {
   static const routeName = '/Quize';
 
 int? id;
 QuizApp( {this.id});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 19),
        title:Text("") ,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          // decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [blue, darkBlue],
          // )),
        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  
                'images/casual-life-3d-boy-lying-on-stomach-and-using-tablet-with-stylus-in-hand.png'        ,alignment: Alignment.center,      ),
              ),
              const SizedBox(height: 180),
Text('We Starting The Quize Now ... Are you ready ! '),
const SizedBox(height: 10),
Text('If You Ready Click ON Button Start'),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(QuizScreen.routeName);
                  //  Navigator.push(context, MaterialPageRoute(builder: (context) =>  QuizScreen()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    alignment: Alignment.center,
                    width: size.width - 100,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color:  Colors.teal.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("Start"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
