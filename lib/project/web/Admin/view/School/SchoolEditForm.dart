import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Controller/School/SchoolController.dart';
import '../../Controller/School/School_screen.dart';
import '../../widgets/EditPage/InputDecoration.dart';
import '../../widgets/EditPage/TextField.dart';

class SchoolFormEdit extends StatefulWidget {
  @override
  State<SchoolFormEdit> createState() => _SchoolFormEditState();
}

class _SchoolFormEditState extends State<SchoolFormEdit> {
  final formKey = GlobalKey<FormState>();
  SchoolController controllerc = Get.find();
  TimeOfDay timeOfDay = TimeOfDay.now();
  int? hour;
  int? min;
  TextEditingController? _timeC;
  @override
  void initState() {
     _timeC =TextEditingController(text: "${controllerc.school!.BusTime!.hour}:${controllerc.school!.BusTime!.minute}");
  }
  @override
  Widget build(BuildContext context) {
    // final _timeC =TextEditingController(text: "00:00");
    // TextEditingController(text: "${controllerc.school!.BusTime!.hour}:${controllerc.school!.BusTime!.minute}");

    return SingleChildScrollView(
        child: GetBuilder<SchoolControllerScreen>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: formKey,
            child: GetBuilder<SchoolController>(
              builder: (controller1) => Wrap(
                children: <Widget>[
                  TextField1(
                      "Name",
                      TextFormField(
                        initialValue: controller1.school!.name,
                        decoration: decoration(),
                        validator: (value) {
                          if (value != null && !value.isAlphabetOnly) {
                            return 'Invalid School name should be alphabet!';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controller.EditedData!.name = value!;
                        },
                      ),
                      controller.nameMsg),
                  TextField1(
                    "phone",
                    TextFormField(
                      initialValue: controller1.school!.phone.toString(),
                      decoration: decoration(),
                      validator: (value) {
                        if (value != null &&
                            !value.isNumericOnly &&
                            value.length != 10) {
                          return 'Invalid phone number should be numeric! and 10 digits';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                        });
                        controller.EditedData!.phone = int.parse(value!);
                      },
                    ),
                    controller.phoneMsg,
                  ),
                  TextField1(
                      "Bus Time",
                      TextFormField(
                        decoration: decoration(),
                        controller: _timeC,
                        onSaved: (value) {
                          if (hour != null) {
                            controller.EditedData!.BusTime =
                                new DateTime(0, 0, 0, hour!, min!, 0, 0, 0);
                          }
                        },
                      ),
                      ""),
                  Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton.icon(
                        onPressed: () async {
                          var time = await showTimePicker(
                              context: context, initialTime: timeOfDay);

                          if (time != null) {
                            setState(() {
                              hour = time.hour;
                              min = time.minute;
                              _timeC!.text = "${time.hour}:${time.minute}";
                            });
                          }
                        },
                        icon: Icon(Icons.access_time_rounded),
                        label: Text(""),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          if (controller.isLoading)
            CircularProgressIndicator()
          else
            ElevatedButton(
              child: Text('   Edit    '),
              onPressed: () {
                if (!formKey.currentState!.validate()) {
                  return;
                }
                formKey.currentState!.save();
                controller.Edit();
              },
            ),
          SizedBox(
            height: 23.h,
          ),
        ],
      ),
    ));
  }
}
