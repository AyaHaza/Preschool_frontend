import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Controller/RegestryMangement/RegisteryController.dart';
import '../../../Controller/RegestryMangement/RegistryScreenController.dart';

import '../../../../../../../../../CONSTANT/colors.dart';
import '../../../widgets/EditPage/DropDown.dart';
import '../../../widgets/EditPage/InputDecoration.dart';

import '../../../widgets/EditPage/date.dart';


class RegisteryContentEdit extends StatefulWidget {
  int id;

  RegisteryContentEdit({required this.id});

  @override
  State<RegisteryContentEdit> createState() => _RegisteryContentEditState();
}

class _RegisteryContentEditState extends State<RegisteryContentEdit> {
//  LevelController levelController = Get.find();
  final formKey = GlobalKey<FormState>();
final List<String> genderItems = [
    'male',
    'female',
  ];
  final List<String> itemDegree = [
    'bachalor',
    'bachalors',
    'master',
  ];
  final List<String> rolrItem = [
    'teacher',
    'manager',
    'employee',
    'bus_supervisor',
    'admin',
  ];
    TextEditingController dateCtl = TextEditingController();

  bool isDateSelected = false;
  @override
  Widget build(BuildContext context) {

    print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
    return SingleChildScrollView(
        child: GetBuilder<RegisteryControllerScreen>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GetBuilder<RegisteryController>(
            builder: (controller1) => Form(
              key: formKey,
              child: Wrap(
                children: <Widget>[
                  TextField1(
                      "Name",
                      TextFormField(
                        validator: (value) {
                          if (value==null ||value.isEmpty|| !value.isAlphabetOnly) {
                            return 'Invalid  name should be not empty and alphabet!';
                          }
                          return null;
                        },

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
                        'Select  Gender',
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

                     "Birthday",
                         // "${controller1.Classes[super.widget.id]!.birthday}",
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

                                controller.EditedData!.birthday= birthDate;
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
                        validator: (value) {
                          if (value == null||value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (value == null||value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
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
                      'Degree',
                      DropDown(
                        'Select Degree',
                       itemDegree
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
                            controller.EditedData!.degree = value;
                          } else{
                             value=controller1.Classes[super.widget.id]!.degree;
                           controller.EditedData!.degree = value;
                          }
                        },
                      ),
                      controller.degreeMsg),
                
               TextField1(
                      "specialization",
                      TextFormField(
                        validator: (value) {
                          if (value == null||value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        initialValue:
                            controller1.Classes[super.widget.id]!.specialization,
                        decoration: decoration(),
                     
                        onSaved: (value) {
                          controller.EditedData!.specialization = value;
                        },
                      ),
                      ''),
                 
                  TextField1(
                      'Role',
                      DropDown(
                        'Select Role',
                       rolrItem
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
                              
                          controller.EditedData!.role = value;
                          }  else{
                             value=controller1.Classes[super.widget.id]!.role;
                           controller.EditedData!.role = value;
                          }
                       
                        },
                      ),
                      controller.roleMsg),
              
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
                if(controller.EditedData!.birthday==null) {
                  controller.EditedData!.birthday=controller.controller.Classes[widget.id]!.birthday;
                }
                print("888888888888888888888888");
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
