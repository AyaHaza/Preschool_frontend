import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Controller/Advertisement/Teacher/Classes.dart';
import '../../../Controller/Attendance/formScreen.dart';
import '../../../widgets/EditPage/DropDown.dart';
import '../../../widgets/EditPage/TextField.dart';
import '../../Template.dart';
import 'AllStudentcheck.dart';

class Attendancecheckform extends StatefulWidget {
  static const routeName = '/Attendance-check';

  @override
  State<Attendancecheckform> createState() => _AttendancecheckformState();
}

class _AttendancecheckformState extends State<Attendancecheckform> {
  TextEditingController dateCtl = TextEditingController();

  TeacherClassController controller1 = Get.find();

  final formKey = GlobalKey<FormState>();

  bool isDateSelected = false;


  @override
  Widget build(BuildContext context) {
    int? class_id;
    // TODO: implement build
    return Template(
        title: "Absence Information",
        body: Center(
          child:SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Form(
                            key: formKey,
                            child: Wrap(
                                direction: Axis.vertical,
                                spacing: 10.w,
                                children: <Widget>[
                            GetBuilder<TeacherClassController>(
                            builder: (controller) => TextField1(
                                      'Class',
                                      DropDown(
                                        'Select class',
                                        controller1.Teacherclass.keys
                                            .map((item) => DropdownMenuItem<String>(
                                          value: item.toString(),
                                          child: Text(
                                            "class $item",
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        )).toList(),
                                            (value) {
                                              class_id= int.parse(value!);
                                        },(v){}
                                      ),
                                      ""
                                  ),
                            ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                    ElevatedButton(
                                      child: Text('  View students '),
                                      onPressed: () {
                                        if (!formKey.currentState!.validate()) {
                                          return;
                                        }
                                        formKey.currentState!.save();



                                        Get.toNamed(ALLStudentscheck.routeName,arguments: [class_id]);

                                      },
                                    ),
                                ]))
                      ])),
        )
    );
  }
}
