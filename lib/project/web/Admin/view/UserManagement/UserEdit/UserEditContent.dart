import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/colors.dart';
import '../../../Controller/Users/UsersController.dart';
import '../../../Controller/Users/UsersScreenController.dart';
import '../../../widgets/EditPage/DropDown.dart';
import '../../../widgets/EditPage/InputDecoration.dart';

import '../../../widgets/EditPage/date.dart';


class UserContentEdit extends StatefulWidget {
  int id;

  UserContentEdit({required this.id});

  @override
  State<UserContentEdit> createState() => _UserContentEditState();
}

class _UserContentEditState extends State<UserContentEdit> {
//  LevelController levelController = Get.find();
  final formKey = GlobalKey<FormState>();
  final List<String> rolrItem = [
    'teacher',
    'manager',
    'employee',
    'bus_supervisor',
    'admin',
  ];
  final List<String> statusItem = [
    'active',
    'suspended',
  ];

  TextEditingController dateCtl = TextEditingController();
  bool isDateSelected = false;
  @override
  Widget build(BuildContext context) {
    print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
    return SingleChildScrollView(
        child: GetBuilder<UsersControllerScreen>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GetBuilder<UsersController>(
                builder: (controller1) => Form(
                  key: formKey,
                  child: Wrap(
                    children: <Widget>[
                      TextField1(
                          "Name",
                          TextFormField(
                            initialValue:
                            controller1.users[super.widget.id]!.name,
                            decoration: decoration(),

                            onSaved: (value) {
                              controller.EditedData!.name = value;
                            },
                          ),
                          controller.nameMsg),
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
                              } else{
                                value=controller1.users[super.widget.id]!.role;
                                controller.EditedData!.role = value;
                              }
                            },
                          ),
                          controller.roleMsg),
                      TextField1(
                          'Status',
                          DropDown(
                            'Select Status',
                            statusItem
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
                                controller.EditedData!.status = value;
                              } else{
                                value=controller1.users[super.widget.id]!.status;
                                controller.EditedData!.status = value;
                              }
                            },
                          ),
                          controller.statusMsg),

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
