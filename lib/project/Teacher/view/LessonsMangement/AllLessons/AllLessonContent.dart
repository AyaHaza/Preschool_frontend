import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/colors.dart';
import '../../../Controller/Lessons/LessonsController.dart';
import '../AddLessons/AddLesson.dart';
import '../EditLesson/EditLesson.dart';



class AllLessonsContent extends StatefulWidget {

  int Subjectid;
  int Classid;
  AllLessonsContent({required this.Subjectid,required this.Classid});
  @override
  State<AllLessonsContent> createState() => _AllLessonsContentState();
}

class _AllLessonsContentState extends State<AllLessonsContent> {
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal.withOpacity(0.4),
          onPressed: ()async {

            await Get.toNamed(LessonAdd.routeName);
            //Get.back();



          },
          child: Icon(Icons.add,color: AppColors.white,),
        ),

        body: FutureBuilder(
    future: controller.Fetch1(widget.Subjectid, widget.Classid),
    builder: (ctx, authResultSnapshot) =>
    authResultSnapshot.connectionState ==
    ConnectionState.waiting
    ? const Center(child: CircularProgressIndicator())
        : Container(
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

                            itemCount:controller.SubjectLesson.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Card(
                                child: ListTile(
                                  title: Text('${controller.SubjectLesson.elementAt(index).title}'),
                                  subtitle: Text('${controller.SubjectLesson.elementAt(index).semester}  |  ${controller.SubjectLesson.elementAt(index).number}'),
                                  trailing:Container(
                                    width: 120,
                                    child: Row(
                                      children: [ IconButton(onPressed: (){
                                        //   SizeConfig.id_Lesson=controller.allLessons.values.elementAt(index).id!.toString();
                                          // print('object ${controller.QuizeSt.values.elementAt(index).id!}');

                                          Get.to(()=>EditLesson(index:index,SubjectLesson: controller.SubjectLesson,classid: widget.Classid,));
                                        },
                                          icon: Icon(Icons.edit,color: Color(0XFF58C294)),),
                                        Expanded(
                                          child:   IconButton(
                                              onPressed: () async{

                                                await  Get.defaultDialog(
                                                  title: 'Delete',
                                                  content: Row(
                                                    children: [
                                                      Text("Are You Sure Delete Lesson ",style: TextStyle(color: Colors.grey),),
                                                      Expanded(child: Text("${controller.SubjectLesson.elementAt(index).title!}",style: TextStyle(fontWeight: FontWeight.bold),))
                                                    ],
                                                  ),
                                                  buttonColor:Colors.teal.withOpacity(0.4) ,
                                                  confirmTextColor: AppColors.white,
                                                  cancelTextColor: Colors.black ,
                                                  textConfirm: 'Yes',
                                                  textCancel: 'No',
                                                  onConfirm: ()async {
                                                    Get.back();
                                                    await  controller.Delete(controller.SubjectLesson.elementAt(index).id!);
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
              )


        ));
  }
}
