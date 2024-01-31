import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/size_config.dart';
import '../../../Controller/Lessons/LessonsController.dart';
import '../AllHomework/AllHomework.dart';


class AllLessonsHContent extends StatefulWidget {


  @override
  State<AllLessonsHContent> createState() => _AllLessonsHContentState();
}

class _AllLessonsHContentState extends State<AllLessonsHContent> {
  LessonsController controller = Get.find();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 19),
        title:Text("Lessones") ,
      ),


        body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          ),
        child: GetBuilder<LessonsController>(
                  builder: (controller)
                  {
              return


                        ListView.builder(

                            itemCount:controller.allLessons.values.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Card(
                                child: ListTile(
                                  title: Text('${controller.allLessons.values.elementAt(index).title}'),
                                  subtitle: Text('${controller.allLessons.values.elementAt(index).semester}  |  ${controller.allLessons.values.elementAt(index).number}'),
                                  trailing:TextButton(onPressed: (){
                                    SizeConfig.id_Lesson=controller.allLessons.values.elementAt(index).id.toString();
                                    Get.toNamed(AllHomework.routeName);
                                   },
                                  child: Text('Show Homeworks',style: TextStyle(color:  Colors.teal.withOpacity(0.4)),),)

                                    ),
                              );
                            });
                      })
              )


    );
  }
}
