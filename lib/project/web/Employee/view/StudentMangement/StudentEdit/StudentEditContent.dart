import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../CONSTANT/colors.dart';
import '../../../Controller/StudentMangement/StudentController.dart';
import '../../../Controller/StudentMangement/StudentScreenController.dart';
import '../../../widgets/EditPage/DropDown.dart';
import '../../../widgets/EditPage/InputDecoration.dart';

import '../../../widgets/EditPage/date.dart';

final List<String> BusItems = [
  '0',
  '1',
];
class StudentContentEdit extends StatefulWidget {
  int id;

  StudentContentEdit({required this.id});

  @override
  State<StudentContentEdit> createState() => _StudentContentEditState();
}

class _StudentContentEditState extends State<StudentContentEdit> {
//  LevelController levelController = Get.find();
  final formKey = GlobalKey<FormState>();
final List<String> genderItems = [
    'male',
    'female',
  ];

    TextEditingController dateCtl = TextEditingController();
  bool isDateSelected = false;
  @override
  Widget build(BuildContext context) {
    print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
    return SingleChildScrollView(
        child: GetBuilder<StudentControllerScreen>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GetBuilder<StudentController>(
            builder: (controller1) => Form(
              key: formKey,
              child: Wrap(
                children: <Widget>[
                  TextField1(
                      "Name",
                      TextFormField(
                        initialValue:
                            controller1.Classes[super.widget.id]!.fullName,
                        decoration: decoration(),
                     
                        onSaved: (value) {
                          controller.EditedData!.fullName = value;
                        },
                      ),
                      controller.nameMsg),
                   TextField1(
                      'Gender',
                      DropDown(
                        'Select class Gender',
                       genderItems
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        (value) {
                          if (value != null) {
                            controller.EditedData!.gender = value;
                          } else{
                             value=controller1.Classes[super.widget.id]!.gender;
                           controller.EditedData!.gender = value;
                          }
                        },
                      ),
                      controller.genderMsg),
                 TextField1(
                          "Date",
                          date(dateCtl,() async {
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
                                    "${birthDate.month}/${birthDate.day}/${birthDate
                                    .year}";

                                dateCtl.text = birthDateInString;

                                controller.EditedData!.birthday= birthDateInString;
                              });
                            }
                          },
                        ),
                          controller.birthdayMsg
                      )
                   , 
                       TextField1(
                      "Phone",
                      TextFormField(
                        initialValue:
                            controller1.Classes[super.widget.id]!.phone,
                        decoration: decoration(),
                     
                        onSaved: (value) {
                          controller.EditedData!.phone = value;
                        },
                      ),
                      controller.phoneMsg),
                 
                  TextField1(
                      "Location",
                      TextFormField(
                        initialValue:
                            controller1.Classes[super.widget.id]!.location,
                        decoration: decoration(),
                     
                        onSaved: (value) {
                          controller.EditedData!.location = value;
                        },
                      ),
                      controller.locationMsg),
                 
                TextField1(
                      "HealthyInfo",
                      TextFormField(
                        initialValue:
                            controller1.Classes[super.widget.id]!.healthyFood,
                        decoration: decoration(),
                     
                        onSaved: (value) {
                          controller.EditedData!.healthyFood = value;
                        },
                      ),
                      ''),
                 
                  
               TextField1(
                      "motherName",
                      TextFormField(
                        initialValue:
                            controller1.Classes[super.widget.id]!.motherName,
                        decoration: decoration(),
                     
                        onSaved: (value) {
                          controller.EditedData!.motherName = value;
                        },
                      ),
                      ''),
                 TextField1(
                      "motherLastName",
                      TextFormField(
                        initialValue:
                            controller1.Classes[super.widget.id]!.motherLastName,
                        decoration: decoration(),
                     
                        onSaved: (value) {
                          controller.EditedData!.motherLastName = value;
                        },
                      ),
                      ''),
                 TextField1(
                      "siblingNo",
                      TextFormField(
                        initialValue:
                            controller1.Classes[super.widget.id]!.siblingNo,
                        decoration: decoration(),
                     
                        onSaved: (value) {
                          controller.EditedData!.siblingNo = value;
                        },
                      ),
                      ''),
                 TextField1(
                      "bus_id",
                      TextFormField(
                        initialValue:
                            controller1.Classes[super.widget.id]!.bus_id,
                        decoration: decoration(),
                     
                        onSaved: (value) {
                          controller.EditedData!.bus_id = value;
                        },
                      ),
                      ''),
                  TextField1(
                      'bus_discount',
                      DropDown(
                        'Are You In bus_discount?',
                        BusItems
                            .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                            .toList(),
                            (value) {
                          controller.Data!.bus_discount = value;
                        },
                      ),
                      ''),
                  TextField1(
                      'study_discount',
                      DropDown(
                        'Are You In study_discount?',
                        BusItems
                            .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                            .toList(),
                            (value) {
                          controller.Data!.study_discount = value;
                        },
                      ),
                      ''),
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
                controller.Edit(super.widget.id);
              },
            ),
          SizedBox(
            height: 23.h,
          ),
        ],
      ),
    ));
  }
    Widget TextField1(String label, Widget text, String? error) {
    return SizedBox(
        width: 200.w,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              SizedBox(height: 50.h, child: text),
              SizedBox(
                  height: 40.h,
                  child: 
                  (error!='')?
                  Text(
                    error!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColors.card1),
                  ):Text('')),
            ],
          ),
        ));
  }

}
