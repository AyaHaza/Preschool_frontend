import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/CONSTANT/colors.dart';
import '/CONSTANT/responsive.dart';
import '../../Controller/Clasees/class_Screen.dart';
import '../../Controller/Levels/LevelController.dart';
import '../../widgets/EditPage/DropDown.dart';

class ClassForm extends StatefulWidget {
  @override
  State<ClassForm> createState() => _ClassFormState();
}

class _ClassFormState extends State<ClassForm> {
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassControllerScreen>(
        builder: (controller) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: formKey,
                    child: Wrap(
                     direction: (Responsive.isMobile(context)) ?Axis.vertical : Axis.horizontal,
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
                                controller.Data!.name = value;
                              },
                            ),
                            controller.nameMsg),
                        TextField1(
                          "Capacity",
                          TextFormField(
                            decoration: decoration(),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || !value.isNumericOnly) {
                                return 'Invalid Capacity should be not empty and numeric!';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              controller.Data!.capacity = int.parse(value!);
                            },
                          ),
                          controller.CapacityMsg,
                        ),
                    GetBuilder<LevelController>(
                      builder: (controller1) =>
                        TextField1(
                            'Level',
                            DropDown(
                              'Select class Level',
                              controller1.levels.values
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item.id.toString(),
                                        child: Text(
                                          item.name!,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              (value) {
                                controller.Data!.levelId = int.parse(value!);
                              },
                            ),
                            controller.level_idMsg),
                    )
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
