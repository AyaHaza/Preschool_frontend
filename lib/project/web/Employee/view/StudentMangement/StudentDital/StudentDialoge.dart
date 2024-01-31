import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Controller/StudentMangement/StudentController.dart';


class StudentdialogDetail extends StatelessWidget {
  int id;
  StudentdialogDetail({required this.id});
  //LevelController controller1 =Get.find();
  StudentController controller =Get.find();

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height: 700.h,
        child: SingleChildScrollView(
          child: Wrap(
            ////  mainAxisAlignment: MainAxisAlignment.spaceAround,

direction: Axis.horizontal,            //  ,
                 children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              'Name Employee:',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 173, 171, 171)),
                            ),
                            Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.w),
                              child: Container(
                                color: Color.fromARGB(255, 247, 244, 244),
                                child: TextFormField(
                                  // textAlignVertical: TextAlignVertical.center,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      prefixText: '     ',
                                      border: UnderlineInputBorder(),
                                      hintText: controller.Classes.values
                                          .elementAt(id)
                                          .fullName,
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      )),
                                ),
                              ),
                            ),
                            Text(
                              'motherName :',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 173, 171, 171)),
                            ),


                            Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.w),
                              child: Container(
                                color: Color.fromARGB(255, 247, 244, 244),
                                child: TextFormField(
                                  // textAlignVertical: TextAlignVertical.center,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      prefixText: '     ',
                                      border: UnderlineInputBorder(),
                                      hintText: controller.Classes.values
                                          .elementAt(id)
                                          .motherName,
                                      hintStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),


                            Text(
                              'motherNameLast :',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 173, 171, 171)),
                            ),


                            Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.w),
                              child: Container(
                                color: Color.fromARGB(255, 247, 244, 244),
                                child: TextFormField(
                                  // textAlignVertical: TextAlignVertical.center,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      prefixText: '     ',
                                      border: UnderlineInputBorder(),
                                      hintText: controller.Classes.values
                                          .elementAt(id)
                                          .motherLastName,

                                      hintStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),

                            Text(
                              'Gender :',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 173, 171, 171)),
                            ),
                            Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.w),
                              child: Container(
                                color: Color.fromARGB(255, 247, 244, 244),
                                child: TextFormField(
                                  // textAlignVertical: TextAlignVertical.center,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      prefixText: '     ',
                                      border: UnderlineInputBorder(),
                                      hintText: controller.Classes.values
                                          .elementAt(id)
                                          .gender!,
                                      hintStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            // Text(
                            //   'siblingNo :',
                            //   style: TextStyle(
                            //       fontSize: 10,
                            //       color: Color.fromARGB(255, 173, 171, 171)),
                            // ),
                            // Padding(
                            //   padding:
                            //       EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                            //   child: Container(
                            //     color: Color.fromARGB(255, 247, 244, 244),
                            //     child: TextFormField(
                            //       // textAlignVertical: TextAlignVertical.center,
                            //       enabled: false,
                            //       decoration: InputDecoration(
                            //           prefixText: '     ',
                            //           border: UnderlineInputBorder(),
                            //           hintText: controller.controller.student!.values
                            //               .elementAt(0)!
                            //               .siblingNo.toString(),
                            //           hintStyle: TextStyle(
                            //               fontSize: 15,
                            //               color: Colors.black,
                            //               fontWeight: FontWeight.bold)),
                            //     ),
                            //   ),
                            // ),
                             Text(
                              'location :',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 173, 171, 171)),
                            ),
                            Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.w),
                              child: Container(
                                color: Color.fromARGB(255, 247, 244, 244),
                                child: TextFormField(
                                  // textAlignVertical: TextAlignVertical.center,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      prefixText: '     ',
                                      border: UnderlineInputBorder(),
                                      hintText: controller.Classes.values
                                          .elementAt(id)
                                          .location!,
                                      hintStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            Text(
                              'phone :',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 173, 171, 171)),
                            ),
                            Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.w),
                              child: Container(
                                color: Color.fromARGB(255, 247, 244, 244),
                                child: TextFormField(
                                  // textAlignVertical: TextAlignVertical.center,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      prefixText: '     ',
                                      border: UnderlineInputBorder(),
                                      hintText: controller.Classes.values
                                          .elementAt(id)
                                          .phone!
                                          .toString(),
                                      hintStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            Text(
                              'birthday :',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 173, 171, 171)),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.w),
                              child: Container(
                                color: Color.fromARGB(255, 247, 244, 244),
                                child: TextFormField(
                                  // textAlignVertical: TextAlignVertical.center,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      prefixText: '     ',
                                      border: UnderlineInputBorder(),
                                      hintText: controller.Classes.values
                                          .elementAt(id)
                                          .birthday!.toString(),
                                      hintStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            // Text(
                            //   'status :',
                            //   style: TextStyle(
                            //       fontSize: 10,
                            //       color: Color.fromARGB(255, 173, 171, 171)),
                            // ),
                            // Padding(
                            //   padding:
                            //       EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                            //   child: Container(
                            //     color: Color.fromARGB(255, 247, 244, 244),
                            //     child: TextFormField(
                            //       // textAlignVertical: TextAlignVertical.center,
                            //       enabled: false,
                            //       decoration: InputDecoration(
                            //           prefixText: '     ',
                            //           border: UnderlineInputBorder(),
                            //           hintText: controller.Classes.values
                            //               .elementAt(id)
                            //               .accountInfo!
                            //               .status,
                            //           hintStyle: TextStyle(
                            //               fontSize: 15,
                            //               color: Colors.black,
                            //               fontWeight: FontWeight.bold)),
                            //     ),
                            //   ),
                            // ),
                          ]),
        ),
      );}
}

Widget field( String val){
  return    Padding(
    padding:
    EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.w),
    child: Container(
      color: Color.fromARGB(255, 247, 244, 244),
      child: TextFormField(
        // textAlignVertical: TextAlignVertical.center,
        enabled: false,
        decoration: InputDecoration(
            prefixText: '     ',
            border: UnderlineInputBorder(),
            hintText: val,
            hintStyle: TextStyle(
              fontSize: 12,
              color: Colors.black,
            )),
      ),
    ),
  );
}