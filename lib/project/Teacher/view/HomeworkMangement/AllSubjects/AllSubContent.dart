import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/size_config.dart';
import '../../../Controller/Subjects/SubjectsController.dart';
import '../AllLessons/AllLesson.dart';



class AllSubjectContentLH extends StatefulWidget {


  @override
  State<AllSubjectContentLH> createState() => _AllSubjectContentLHState();
}

class _AllSubjectContentLHState extends State<AllSubjectContentLH> {



  @override
  Widget build(BuildContext context) {
SubjectsrController controller=Get.find();
    return Scaffold(

        body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          ),
        child: GetBuilder<SubjectsrController>(
                  builder: (controller)
            {
              return
                        ListView.builder(

                            itemCount:controller.AllSubjectTeACHERs.values.length,
                            itemBuilder: (BuildContext ctx, index) {

                              return Card(
                                child: ListTile(
                                  title: Text('${controller.AllSubjectTeACHERs.values.elementAt(index).name}'),
                                  subtitle: Text('${controller.AllSubjectTeACHERs.values.elementAt(index).level_id}'),
                                  trailing:IconButton(onPressed: (){
                                    SizeConfig.id_Sub_Lesson=controller.AllSubjectTeACHERs.values.elementAt(index).id.toString();
                                    Get.toNamed(AllLessonsH.routeName);
                                   },
                                    icon: Icon(Icons.arrow_circle_right,color: Colors.teal.withOpacity(0.4)),)
                                ),
                              );
                            });
                      })
              )


    );
  }
}
