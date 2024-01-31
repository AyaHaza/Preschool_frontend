import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/colors.dart';
import '../../../Controller/RegestryMangement/RegistryScreenController.dart';


import '../../../widgets/EditPage/DropDown.dart';

class RegistryAddForm extends StatefulWidget {
  @override
  _RegistryAddFormState createState() => _RegistryAddFormState();
}
class _RegistryAddFormState extends State<RegistryAddForm> {
  TextEditingController dateCtl = TextEditingController();
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
  final GlobalKey<FormState> formKey = GlobalKey();
 
  String initValue = "Select your Birth Date";
  bool isDateSelected = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisteryControllerScreen>(
        builder: (controller) => Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Wrap(
                        children: <Widget>[
                          TextField1(
                            "Name",
                            TextFormField(
                              decoration: decoration(""),
                              validator: (value) {
                                if (value==null ||value.isEmpty|| !value.isAlphabetOnly) {
                                  return 'Invalid  name should be not empty and alphabet!';
                                }
                                return null;
                              },
                              onSaved: (value) {
   controller.Data!.fullName = value;                              },
                            ),
                          controller.nameMsg ),
                          TextField1(
                            '  Gender ',
                            DropdownButtonFormField2(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              isExpanded: true,
                              hint: const Text(
                                'Select Your Gender',
                                style: TextStyle(fontSize: 14),
                              ),
                              items: genderItems
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
                           
                              onChanged: (value) {
                                //Do something when changing the item if you want.
                              },
                              onSaved: (value) {
controller.Data!.gender = value;                                },
                              buttonStyleData: const ButtonStyleData(
                                height: 60,
                                padding: EdgeInsets.only(left: 20, right: 10),
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                iconSize: 30,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          controller.genderMsg
                          ),
                          TextField1(
                            'Birthday',
                            TextFormField(
                              validator: (value) {
                                if (value==null ||value.isEmpty ) {
                                  return 'Required';
                                }
                                return null;
                              },
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

                                    controller.Data!.birthday  =
                                        birthDate;
                                  });
                                }
                              },
                            ),
                         controller.birthdayMsg ),
                         
                          TextField1(
                            'Phone',
                            TextFormField(
                              validator: (value) {
                                if (value==null||value.isEmpty ) {
                                  return 'Required';
                                }
                                return null;
                              },
                              decoration: decoration(""),

                              onSaved: (value) {
                               controller.Data!.phone = value;  
                              },
                            ),
                          controller.phoneMsg),
                          TextField1(
                            'Location',
                            TextFormField(
                              decoration: decoration(""),
                             
                              onSaved: (value) {
                                controller.Data!.location = value;  
                              },
                            ),
                        controller.locationMsg  ),
                          TextField1(
                            'HealtyInfo',
                            TextFormField(
                              decoration: decoration(""),
                            
                              onSaved: (value) {
                               controller.Data!.healthyFood = value;  
                              },
                            ),
                         '' ),
                          TextField1(
                            '  Degree ',
                            DropdownButtonFormField2(
                              decoration: InputDecoration(
                                //Add isDense true and zero Padding.

                                //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.

                                isDense: true,

                                contentPadding: EdgeInsets.zero,

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),

                                //Add more decoration as you want here

                                //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                              ),
                              isExpanded: true,
                              hint: const Text(
                                'Select Your Degree',
                                style: TextStyle(fontSize: 14),
                              ),
                              items: itemDegree
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
                              
                              onChanged: (value) {
                                //Do something when changing the item if you want.
                              },
                              onSaved: (value) {
                               controller.Data!.degree = value;  
                              },
                              buttonStyleData: const ButtonStyleData(
                                height: 60,
                                padding: EdgeInsets.only(left: 20, right: 10),
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                iconSize: 30,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                       controller.degreeMsg   ),
                          TextField1(
                            ' specialization',
                            TextFormField(
                              validator: (value) {
                                if (value==null||value.isEmpty ) {
                                  return 'Required';
                                }
                                return null;
                              },
                              decoration: decoration(""),
                              
                              onSaved: (value) {
                               controller.Data!.specialization = value;  
                              },
                            ),
                         '' ),
                          TextField1(
                            '  Role ',
                            DropdownButtonFormField2(
                              decoration: InputDecoration(
                                //Add isDense true and zero Padding.

                                //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.

                                isDense: true,

                                contentPadding: EdgeInsets.zero,

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),

                                //Add more decoration as you want here

                                //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                              ),
                              isExpanded: true,
                              hint: const Text(
                                'Select Your Role',
                                style: TextStyle(fontSize: 14),
                              ),
                              items: rolrItem
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
                          
                              onChanged: (value) {
                                //Do something when changing the item if you want.
                              },
                              onSaved: (value) {
                              controller.Data!.role = value;  
                              },
                              buttonStyleData: const ButtonStyleData(
                                height: 60,
                                padding: EdgeInsets.only(left: 20, right: 10),
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                iconSize: 30,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                         controller.roleMsg ),
                       
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h,),
                    ElevatedButton(
                        child: Text('  Add  '),
                        onPressed: () {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                             formKey.currentState!.save();
                        controller.Store();
                        },
                      ),
                    SizedBox( height: 23.h,),
                    // Text(
                    //  // controller.msg,
                    //   style: TextStyle(
                    //       color: Colors.red,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 19.sp),
                    // ),
                  ],
                ),
              ),
            ));
  }

  InputDecoration decoration(String? text) {
    return InputDecoration(
      border: const OutlineInputBorder(
          borderSide: BorderSide(width: 30, color: Colors.black)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
      ),
    );
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
