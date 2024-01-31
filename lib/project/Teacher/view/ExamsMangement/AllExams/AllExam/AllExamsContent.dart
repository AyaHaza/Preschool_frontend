import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/colors.dart';
import 'package:project/CONSTANT/size_config.dart';
import '../../../../Controller/Exams/EaxmsController.dart';
import '../../AddExam/AddExam.dart';
import '../../EditExam/EditExam.dart';


class AllExamContent extends StatefulWidget {


  @override
  State<AllExamContent> createState() => _AllExamContentState();
}

class _AllExamContentState extends State<AllExamContent> {
  ExamConrtroller controller = Get.find();


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
        title:Text("Exames") ,
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal.withOpacity(0.4),
          onPressed: ()async {

            await Get.toNamed(AddExam.routeName);
            //Get.back();



          },
          child: Icon(Icons.add,color: AppColors.white,),
        ),

        body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          ),
        child: GetBuilder<ExamConrtroller>(
                  builder: (controller)
                  {
              return


                        ListView.builder(

                            itemCount:controller.AllExam.values.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Card(
                                child: ListTile(
                                  title: Text('${controller.AllExam.values.elementAt(index).name}'),
                                  subtitle: Text('${controller.AllExam.values.elementAt(index).status}  |  ${controller.AllExam.values.elementAt(index).type}'),
                                  trailing:Container(
                                    width: 120,
                                    child: Row(
                                      children: [ IconButton(onPressed: (){
                                           SizeConfig.id_exam=controller.AllExam.values.elementAt(index).id!.toString();
                                          // print('object ${controller.QuizeSt.values.elementAt(index).id!}');

                                          Get.to(()=>EditExam(index:index,name:controller.AllExam.values.elementAt(index).name!.toString()));
                                        },
                                          icon: Icon(Icons.edit,color: Color(0XFF58C294)),),
                                        Expanded(
                                          child:   IconButton(
                                              onPressed: () async{

                                                await  Get.defaultDialog(
                                                  radius: 10,
                                                  title:"Delete",
                                                  content: Center(child:
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text( 'Are You Sure Delete   ',style: TextStyle(color: Colors.grey),),
                                                        Expanded(child: Text("${controller.AllExam.values.elementAt(index).name!}",style: TextStyle(fontWeight: FontWeight.bold),))
                                                      ],
                                                    ),),
                                                  buttonColor:Colors.teal.withOpacity(0.4) ,
                                                  confirmTextColor: AppColors.white,
                                                  cancelTextColor: Colors.black ,
                                                  textConfirm: 'Yes',
                                                  textCancel: 'No',
                                                  onConfirm: ()async {
                                                    Get.back();
                                                    await  controller.Delete(controller.AllExam.values.elementAt(index).id!);
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


    );
  }
}
