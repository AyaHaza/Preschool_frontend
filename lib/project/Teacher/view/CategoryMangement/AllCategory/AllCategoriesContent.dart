import 'dart:convert';

import 'package:flutter/material.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/colors.dart';
import 'package:project/CONSTANT/size_config.dart';
import '../../../Model/AlllCategory.dart';
import '../AddCategory/AddCategory.dart';
import '../EditCategory/EditGategory.dart';
import '../../QuestionMangement/AllQuistion/AllQustion.dart';
 import '../../../Controller/Categories/categoryController.dart';

import '../../../Controller/Authentication/AuthController.dart';
import '../../../Service/Authentication/AuthNetwork.dart';
import '../editCat.dart';

class AllCatContent extends StatefulWidget {

  @override
  State<AllCatContent> createState() => _AllCatContentState();
}

class _AllCatContentState extends State<AllCatContent> {
  CatController controllerx  =Get.put<CatController>(CatController(),permanent: false);

  CatController controller = Get.put(CatController());
  AuthController auth = Get.find();

  // @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 4;
    final double itemWidth = size.width / 2;

    return Scaffold(

        floatingActionButton: FloatingActionButton(
          backgroundColor:  Colors.grey.shade500,
          onPressed: ()async {

         await Get.toNamed(AddCatContentegory.routeName);
         //Get.back();



          },
          child: Icon(Icons.add,color: AppColors.white,),
        ),

        body: Container(
          color: Color(0XFFEFEFF1),
          child: Column(
            children: [


              Expanded(
                child:

                GetBuilder<CatController>(
                    builder: (controller)
                    {
                      return


                      Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                               //   childAspectRatio: (itemWidth / itemHeight),
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10, maxCrossAxisExtent: 200,
                                ),
                                itemCount:controller.AllCateg.values.length,
                                itemBuilder: (BuildContext ctx, index) {
                                 // print(controller.AllCateg.values.elementAt(index).img_path);
                                  return Container(
                                   width: size.width / 20,
                                    height: size.height / 10,
                                    decoration: BoxDecoration(

                                   //   boxShadow: const [AppColors.shadowWidget ],
                                      border: Border.all(color: Colors.grey.withOpacity(0.4), width: 0.5, style: BorderStyle.solid),
                                      color:Color(0XFFFFFFFF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
  SizedBox(height: 10,),
                                        Container(
                                          height:size.height /6,
                                          child: InkWell(
                                              onTap: () {

                                              //  print(controller.AllCateg.values.elementAt(index).img_path);
                                                SizeConfig.id_Cat=controller.AllCateg.values.elementAt(index).id!.toString();

                                                Get.toNamed(quizeTeacher.routeName);
                                              },
                                              child: Image.network('${AuthNetwork.base}/' +'${controller.AllCateg.values.elementAt(index).img}',fit: BoxFit.fill,)
                                          ),
                                        ),

                                        const SizedBox(height: 10),

                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                                          children: [

                                            IconButton(
                                                onPressed: () {
                                                  Get.to(()=>EditCategory(index: index, id:controller.AllCateg.values.elementAt(index).id!,nameImg:controller.AllCateg.values.elementAt(index).img_name));
                                                  },
                                                icon:Icon( Icons.edit,  color: Color(0XFF58C294),size: 20, )
                                            ),

                                           Expanded(child:  Text(
                                             controller.AllCateg.values.elementAt(index).name!,
                                             style:const TextStyle(
                                               color: AppColors.black,
                                               fontWeight: FontWeight.bold,
                                               fontSize: 20,
                                             ),
                                           ),),

                                           IconButton(
                                               onPressed: () async{

                                               await  Get.defaultDialog(
                                                 radius: 10,
                                                 title: "Delete",
                                                   content: Center(
                                                     child: Row(
                                                       mainAxisAlignment: MainAxisAlignment.center,
                                                       children: [
                                                         Text('Are You Sure Delete   ',style: TextStyle(color: Colors.grey),),
                                                         Text(" ${controller.AllCateg.values.elementAt(index).name!}",style: TextStyle(fontWeight: FontWeight.bold),)
                                                       ],
                                                     ),
                                                   ),
                                                   buttonColor:Colors.teal.withOpacity(0.4) ,
                                                   confirmTextColor: AppColors.white,
                                                   cancelTextColor: Colors.black ,
                                                   textConfirm: 'Yes',
                                                   textCancel: 'No',
                                                   onConfirm: ()async {
                                                     Get.back();
                                                   await  controller.Delete(controller.AllCateg.values.elementAt(index).id!);
                                                   // Get.back();
                                                   },
                                                 );

                                               },
                                               icon: Icon(
                                                 Icons.delete,
                                                 color: Color(0XFFED5A48),
                                                 size: 20,
                                               ))
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          );
  })
                    ),


















            ],
          ),
        ));
  }
}
