import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/colors.dart';
import '../../../Controller/HomeWork/HomeworkController.dart';
import '../AddHomework/AddHomework.dart';
import '../EditHomework/EditHomework.dart';
import '../EditHomework/EditHomeworkContent.dart';
import 'package:readmore/readmore.dart';



class AllHomeworkContent extends StatefulWidget {


  @override
  State<AllHomeworkContent> createState() => _AllHomeworkContentState();
}

class _AllHomeworkContentState extends State<AllHomeworkContent> {
  HomeworkController controller = Get.find();


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
          title:Text("Homeworks") ,
      ),

floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal.withOpacity(0.4),
          onPressed: ()async {

            await Get.toNamed(HomeworkAdd.routeName);
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
        child: GetBuilder<HomeworkController>(
                  builder: (controller)
                  {
              return


                        ListView.builder(

                            itemCount:controller.allHomeworks.values.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Card(
                                child: ListTile(
                                  title: ReadMoreText('${controller.allHomeworks.values.elementAt(index).description}', trimLines: 2,
                                    colorClickableText: Colors.pink,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Show more',
                                    trimExpandedText: '  Show less',
                                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color:Colors.teal.withOpacity(0.4) ),
                                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.teal.withOpacity(0.4)),),

                                  subtitle: Text('Page Number :  ${controller.allHomeworks.values.elementAt(index).page_number}'),
                                  trailing:TextButton(onPressed: (){
                                   // SizeConfig.id_Sub_Lesson=controller.allLessons.values.elementAt(index).id.toString();
                                    //Get.toNamed(AllLessons.routeName);
                                   },
                                  child: Container(
                                    width: 120,
                                    child: Row(
                                      children: [ IconButton(onPressed: (){
                                          // print('object ${controller.QuizeSt.values.elementAt(index).id!}');

                                          Get.to(()=>EditHomework(index:index));
                                        },
                                          icon: Icon(Icons.edit,color: Color(0XFF58C294)),),
                                        Expanded(
                                          child:   IconButton(
                                              onPressed: () async{

                                                await  Get.defaultDialog(
                                                  radius: 10,
                                                  content:  Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text('Are You Sure For Delete This Homwork ',style: TextStyle(color: Colors.grey),),

                                                       // SingleChildScrollView(
                                                       //   child:
                                                       //     SizedBox(height: 50,width: 100,
                                                       //     child:  ReadMoreText(  "${controller.allHomeworks.values.elementAt(index).description!}", trimLines: 1,
                                                       //       colorClickableText: Colors.pink,
                                                       //       trimMode: TrimMode.Line,
                                                       //       trimCollapsedText: 'Show more',
                                                       //       trimExpandedText: 'Show less',
                                                       //       moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color:Colors.teal.withOpacity(0.4) ),
                                                       //       lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.teal.withOpacity(0.4)),
                                                       //     ),)
                                                       // ),
                                                        

                                                      ],
                                                    ),
                                                  ),
                                                  title:"Delete",
                                                  // [
                                                  //   Text('Are You Sure For Delete  '),
                                                  // Text("${controller.allHomeworks.values.elementAt(index).description!}")],
                                                  buttonColor:  Colors.teal.withOpacity(0.4),
                                                  confirmTextColor: AppColors.white,
                                                  cancelTextColor: AppColors.black,
                                                  textConfirm: 'Yes',
                                                  textCancel: 'No',
                                                  onConfirm: ()async {
                                                    Get.back();
                                                    await  controller.Delete(controller.allHomeworks.values.elementAt(index).id!);
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
                                  ),)

                                    ),
                              );
                            });
                      })
              )


    );
  }
}
