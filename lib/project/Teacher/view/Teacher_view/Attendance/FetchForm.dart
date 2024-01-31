import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Controller/Advertisement/Teacher/Classes.dart';
import '../../../Controller/Attendance/formScreen.dart';
import '../../../widgets/EditPage/DropDown.dart';
import '../../../widgets/EditPage/TextField.dart';
import '../../Template.dart';

class AttendanceView extends StatefulWidget {
  static const routeName = '/Attendance';

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  TextEditingController dateCtl = TextEditingController();

  TeacherClassController controller1 = Get.find();
  final formKey = GlobalKey<FormState>();
  bool isDateSelected = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Template(
        title: "Absence Information",
        body: Center(
          child: GetBuilder<AttendanceControllerScreen>(
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
                                        controller1.teacher_classes_students.keys
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
                                          controller.classid= int.parse(value!);
                                        },(f){}
                                      ),
                                   ""
                                  ),
                                  TextField1(
                                      'Date',
                                      TextFormField(
                                        controller: dateCtl,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 30, color: Colors.black)),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context).primaryColor),
                                          ),
                                          // labelText: "Date of birth",
                                        ),
                                        onTap: () async {
                                          //DateTime date = DateTime(1900);

                                          FocusScope.of(context)
                                              .requestFocus(new FocusNode());

                                          final datePick = await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2100));

                                          DateTime birthDate = DateTime.now();

                                          if (datePick != null && datePick != birthDate) {
                                            setState(() {
                                              birthDate = datePick;

                                              isDateSelected = true;

                                              // instance of DateTime

                                              // put it here

                                              String birthDateInString =
                                                  "${birthDate.month}/${birthDate.day}/${birthDate.year}";

                                              dateCtl.text = birthDateInString;

                                              print(birthDateInString); // 08/14/2019

                                            controller.dateTime  = datePick;
                                            });
                                          }
                                        },
                                      ),
                                      ""
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  if (controller.isLoading)
                                    CircularProgressIndicator()
                                  else
                                  ElevatedButton(
                                    child: Text('  View Absent students '),
                                    onPressed: () {
                                      if (!formKey.currentState!.validate()) {
                                        return;
                                      }
                                      formKey.currentState!.save();
                                      controller.Fetch();
                                    },
                                  ),


                                ]))
                      ]))),
        ));
  }
}
