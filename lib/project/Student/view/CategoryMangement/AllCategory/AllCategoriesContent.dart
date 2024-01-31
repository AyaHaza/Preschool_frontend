import 'dart:convert';

import 'package:flutter/material.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/colors.dart';
import 'package:project/CONSTANT/size_config.dart';
import '../../../Service/Authentication/AuthNetwork.dart';
import '../../Quizes/Quiz.dart';
 import '../../../Controller/Categories/categoryController.dart';

class AllCatContent extends StatelessWidget {


  CatController controller = Get.find();
  // @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 4;
    final double itemWidth = size.width / 2;

    return Scaffold(


        body: Container(
          color: Color(0XFFEFEFF1),
          child: Column(
            children: [

              Expanded(
                child:

                GetBuilder<CatController>(
                    builder: (controller)
                    {return


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
                                  return Container(
                                   width:  20.w,
                                    height:10.h,
                                    decoration:BoxDecoration(

                                      //   boxShadow: const [AppColors.shadowWidget ],
                                      border: Border.all(color: Colors.grey.withOpacity(0.4), width: 0.5, style: BorderStyle.solid),
                                      color:Color(0XFFFFFFFF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        Container(
                                          height:100.h,
                                          child: InkWell(
                                              onTap: () {
                                                print(controller.AllCateg.values.elementAt(index).img);
                                                SizeConfig.id_Cat=controller.AllCateg.values.elementAt(index).id!.toString();

                                                print(SizeConfig.id_Cat);
                                                Get.toNamed(QuizApp.routeName);  print(SizeConfig.id_Cat);
                                              },
                                              child: Image.network("${AuthNetwork.base}/" +'${controller.AllCateg.values.elementAt(index).img}',)
                                          ),
                                        ),

                                        const SizedBox(height: 10),

                                        Expanded(child:  Text(
                                          controller.AllCateg.values.elementAt(index).name!,
                                          style:const TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),)
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
