import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Controller/Advertisement/Teacher/Classes.dart';
import '../../../Controller/Attendance/formScreen.dart';
import '../../../Controller/SubjectClasses/SubjectClassesController.dart';
import '../../../widgets/EditPage/DropDown.dart';
import '../../../widgets/EditPage/TextField.dart';
import '../../Template.dart';
import '../AllLessons/AllLesson.dart';

class ClassSubjectView extends StatefulWidget {
  int Subjectid;
  ClassSubjectView({required this.Subjectid});
  @override
  State<ClassSubjectView> createState() => _ClassSubjectViewState();
}

class _ClassSubjectViewState extends State<ClassSubjectView> {
  SubClassesController controller1 = Get.find();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("Dddddddddddddddddsssssssssssssssssssssssssssssss");
    controller1.SubjectClasses[1]!.forEach((element) {print(element.name);print(element.id);});

    int? classid ;
    // TODO: implement build
    return  Center(
          child: GetBuilder<SubClassesController>(
              builder: (controller) => SingleChildScrollView(
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
                                  TextField1(
                                      'Class',
                                      DropDown(
                                          'Select class',
                                          controller.SubjectClasses[widget.Subjectid]!
                                              .map((item) => DropdownMenuItem<String>(
                                            value: item.id.toString(),
                                            child: Text(
                                              "class ${item.name}",
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          )).toList(),
                                              (value) {
                                                classid= int.parse(value!);
                                          },(f){}
                                      ),
                                      ""
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                    ElevatedButton(
                                      child: const Text('  View Subject Lessons '),
                                      onPressed: () {
                                        if (!formKey.currentState!.validate()) {
                                          return;
                                        }
                                        formKey.currentState!.save();
                                        Get.toNamed(AllLessons.routeName,arguments: [classid,widget.Subjectid]);

                                      },
                                    ),


                                ]))
                      ]))),
        );
  }
}
