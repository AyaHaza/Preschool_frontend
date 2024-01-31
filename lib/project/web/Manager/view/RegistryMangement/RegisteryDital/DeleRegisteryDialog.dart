import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Controller/RegestryMangement/RegisteryController.dart';
import '/CONSTANT/colors.dart';


class RegisterydialogDetail extends StatelessWidget {
  int id;
  RegisterydialogDetail({required this.id});
  //LevelController controller1 =Get.find();
  RegisteryController controller =Get.find();

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height: 600.h,
        child: SingleChildScrollView(
          child: Column(
            ////  mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            //  ,
               children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Name Employee:',
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 173, 171, 171)),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 8, vertical: 20),
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
                            'Role :',
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 173, 171, 171)),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                                        .role,
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
                                EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                                        .gender,
                                    hintStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          Text(
                            'Degree :',
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 173, 171, 171)),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                                        .degree,
                                    hintStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          Text(
                            'location :',
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 173, 171, 171)),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                                        .location,
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
                                EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                                        .phone,
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
                                EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                                        .birthday.toString(),
                                    hintStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          Text(
                            'status :',
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 173, 171, 171)),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                                        .status,
                                    hintStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ],),
        ),
      );
  }
}

Widget field( String val){
  return    Padding(
    padding:
    EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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