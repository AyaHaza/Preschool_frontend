import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/project/web/Employee/Controller/Levels/LevelController.dart';

import '/CONSTANT/colors.dart';
import '/CONSTANT/responsive.dart';
import '../../Controller/Levels/Level_Screen.dart';
import '../../widgets/EditPage/InputDecoration.dart';
import '../../widgets/EditPage/TextField.dart';

class LevelFormEdit extends StatefulWidget {
  int id;
  LevelFormEdit({required this.id});

  @override
  State<LevelFormEdit> createState() => _LevelFormEditState();
}

class _LevelFormEditState extends State<LevelFormEdit> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
              child: GetBuilder<LevelControllerScreen>(
        builder: (controller) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              GetBuilder<LevelController>(
              builder: (controller1) =>Form(
                    key: formKey,
                    child: Wrap(
                      direction:   (Responsive.isMobile(context)) ?Axis.vertical : Axis.horizontal,

                      children: <Widget>[
                        TextField1(
                            "Name",
                            TextFormField(
                              initialValue: controller1.levels[super.widget.id]!.name,
                              decoration: decoration(),
                              validator: (value) {
                                if (value != null && !value.isAlphabetOnly) {
                                  return 'Invalid level name should be alphabet!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                controller.EditedData!.name = value;
                              },
                            ),
                            controller.nameMsg),
                        TextField1(
                          "Age",
                          TextFormField(
                            initialValue: controller1.levels[super.widget.id]!.age.toString(),
                            decoration: decoration(),
                            validator: (value) {
                              if (value != null && !value.isNumericOnly) {
                                return 'Invalid level age should be numeric!';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              controller.EditedData!.age= int.parse(value!);
                            },
                          ),
                          controller.ageMsg,
                        ),
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
              )
    );
  }

}
