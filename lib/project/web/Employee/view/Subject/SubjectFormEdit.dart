import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/project/web/Employee/Controller/Levels/LevelController.dart';

import '/CONSTANT/colors.dart';
import '../../Controller/Levels/Level_Screen.dart';
import '../../Controller/Subject/SubjectController.dart';
import '../../Controller/Subject/Subject_screen.dart';
import '../../widgets/EditPage/InputDecoration.dart';
import '../../widgets/EditPage/TextField.dart';
import '../../widgets/EditPage/DropDown.dart';

class SubjectFormEdit extends StatefulWidget {
  int id;
  SubjectFormEdit({required this.id});

  @override
  State<SubjectFormEdit> createState() => _SubjectFormEditState();
}

class _SubjectFormEditState extends State<SubjectFormEdit> {

  final formKey = GlobalKey<FormState>();
  LevelController levelController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<SubjectControllerScreen>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GetBuilder<SubjectController>(
                builder: (controller1) =>Form(
                  key: formKey,
                  child: Wrap(
                    children: <Widget>[
                      TextField1(
                          "Name",
                          TextFormField(
                            initialValue: controller1.Subjects[super.widget.id]!.name,
                            decoration: decoration(),
                            validator: (value) {
                              if (value != null && !value.isAlphabetOnly) {
                                return 'Invalid Subject name should be alphabet!';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              controller.EditedData!.name = value;
                            },
                          ),
                          controller.nameMsg),
                      TextField1(
                          'Level',
                          DropDown(
                            'Select Subject Level',
                            levelController.levels.values
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
                              controller.EditedData!.level_id = int.parse(value!);
                            },
                          ),
                          controller.levelMsg),
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
