import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/responsive.dart';
import 'package:project/project/web/Employee/Controller/Clasees/classController.dart';
import 'package:project/project/web/Employee/Controller/Levels/LevelController.dart';

import '../../Controller/Clasees/class_Screen.dart';
import '../../widgets/EditPage/DropDown.dart';
import '../../widgets/EditPage/InputDecoration.dart';
import '../../widgets/EditPage/TextField.dart';

class ClassFormEdit extends StatefulWidget {
  int id;

  ClassFormEdit({required this.id});

  @override
  State<ClassFormEdit> createState() => _ClassFormEditState();
}

class _ClassFormEditState extends State<ClassFormEdit> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<ClassControllerScreen>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GetBuilder<ClassController>(
            builder: (controller1) => Form(
              key: formKey,
              child: Wrap(
                direction:  (Responsive.isMobile(context)) ?Axis.vertical : Axis.horizontal,
                children: <Widget>[
                  TextField1(
                      "Name",
                      TextFormField(
                        initialValue:
                            controller1.Classes[super.widget.id]!.name,
                        decoration: decoration(),
                        validator: (value) {
                          if (value != null && !value.isAlphabetOnly) {
                            return 'Invalid class name should be alphabet!';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controller.EditedData!.name = value;
                        },
                      ),
                      controller.nameMsg),
                  TextField1(
                    "Capacity",
                    TextFormField(
                      initialValue: controller1
                          .Classes[super.widget.id]!.capacity
                          .toString(),
                      decoration: decoration(),
                      validator: (value) {
                        if (value != null && !value.isNumericOnly) {
                          return 'Invalid capacity should be numeric!';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        controller.EditedData!.capacity = int.parse(value!);
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
                          if (value != null) {
                            controller.EditedData!.levelId = int.parse(value);
                          }
                        },
                      ),
                      controller.level_idMsg),
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
}
