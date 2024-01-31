import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/colors.dart';
import 'package:project/project/web/Employee/Controller/Bus/BusController.dart';
import '../../../Controller/StudentMangement/StudentController.dart';
import '../../../Controller/StudentMangement/StudentScreenController.dart';
import '../../../widgets/EditPage/DropDown.dart';
import '../../../widgets/EditPage/date.dart';

class StudentAddForm extends StatefulWidget {
  @override
  State<StudentAddForm> createState() => _StudentAddFormState();
}

class _StudentAddFormState extends State<StudentAddForm> {
  final formKey = GlobalKey<FormState>();
  TextEditingController dateCtl = TextEditingController();
  bool isDateSelected = false;
  BusController controller1=Get.find();
  StudentController stController = Get.find();
  final List<String> genderItems = [
    'male',
    'female',
  ];
  final List<String> BusItems = [
    '0',
    '1',
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentControllerScreen>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: formKey,
                child: Wrap(
                  spacing:10.w,

                  children: <Widget>[
                    TextField1(
                        "Name",
                        TextFormField(
                          decoration: decoration(),
                          validator: (value) {
                            if (value == null || !value.isAlphabetOnly) {
                              return 'Invalid class rname should be not empty and alphabet!';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            controller.Data!.fullName = value;
                          },
                        ),
                        controller.nameMsg),

                    TextField1(
                        'Gender',
                        DropDown(
                          'Select Gender',
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
                            controller.Data!.gender = value;
                          },
                        ),
                        controller.genderMsg),

                    TextField1(
                        "Birthday",
                        date(dateCtl,() async{
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

                              controller.Data!.birthday =  birthDateInString ;

                            });
                          }
                        },
                        ),
                        controller.birthdayMsg
                    ),
                   
                    TextField1(
                        "phone",
                        TextFormField(
                          decoration: decoration(),

                          onSaved: (value) {
                            controller.Data!.phone = value;
                          },
                        ),
                        controller.phoneMsg),
                    TextField1(
                        "locatiion",
                        TextFormField(
                          decoration: decoration(),
                          validator: (value) {
                            if (value == null || !value.isAlphabetOnly) {
                              return 'Invalid class rname should be not empty and alphabet!';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            controller.Data!.location = value;
                          },
                        ),
                        controller.locationMsg),
                    TextField1(
                        "helthy",
                        TextFormField(
                          decoration: decoration(),
                          validator: (value) {
                            if (value == null || !value.isAlphabetOnly) {
                              return 'Invalid class rname should be not empty and alphabet!';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            controller.Data!.healthyFood = value;
                          },
                        ),
                        controller.healthInfoMsg),
                    TextField1(
                        "MotherName",
                        TextFormField(
                          decoration: decoration(),
                          validator: (value) {
                            if (value == null || !value.isAlphabetOnly) {
                              return 'Invalid class rname should be not empty and alphabet!';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            controller.Data!.motherName = value;
                          },
                        ),
                        controller.motheNameMsg),
                    TextField1(
                        "MotherLastName",
                        TextFormField(
                          decoration: decoration(),
                          validator: (value) {
                            if (value == null || !value.isAlphabetOnly) {
                              return 'Invalid class rname should be not empty and alphabet!';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            controller.Data!.motherLastName = value;
                          },
                        ),
                        controller.motheNameLastMsg),
                    TextField1(
                        "SlibingNo",
                        TextFormField(
                          decoration: decoration(),

                          onSaved: (value) {
                            controller.Data!.siblingNo = value;
                          },
                        ),
                        ''),
                    TextField1(
                        'Bus',
                        DropDown(
                          'Are You In Bus?',
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
                            controller.Data!.bus_id = value;
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
              SizedBox(
                height: 40.h,
              ),
              if (controller.isLoading)
                CircularProgressIndicator()
              else
                ElevatedButton(
                  child: Text('ADD'),
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    formKey.currentState!.save();
                    controller.Store();
                  },
                ),
              SizedBox(
                height: 23.h,
              ),
            ],
          ),
        ));
  }

  InputDecoration decoration() {
    return InputDecoration(
      border: const OutlineInputBorder(
          borderSide: BorderSide(width: 30, color: Colors.black)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
      ),
    );
  }

  Widget TextField1(String label, Widget text, String error) {
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
                  child: Text(
                    error,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColors.card1),
                  )),
            ],
          ),
        ));
  }

}
