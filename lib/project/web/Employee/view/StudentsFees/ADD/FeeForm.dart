import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../CONSTANT/colors.dart';
import '../../../../../../CONSTANT/responsive.dart';
import '../../../Controller/Clasees/class_Screen.dart';
import '../../../Controller/Levels/LevelController.dart';
import '../../../Controller/StudentFee/Fee_screen.dart';
import '../../../Controller/StudentMangement/StudentController.dart';
import '../../../widgets/EditPage/DropDown.dart';

class FeeForm extends StatefulWidget {

  @override
  State<FeeForm> createState() => _FeeFormState();
}

class _FeeFormState extends State<FeeForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeeControllerScreen>(
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
                      "Amount",
                      TextFormField(
                        decoration: decoration(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value==null || !value.isNumericOnly) {
                            return 'Invalid Amount should be not empty and numeric!';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controller.Data!.amount = int.parse(value!);
                        },
                      ),
                      controller.amount,
                    ),
                    GetBuilder<StudentController>(
                      builder: (controller1) =>
                          TextField1(
                              'Student',
                              DropDown(
                                'Select Student ',
                                controller1.Classes.values
                                    .map((item) => DropdownMenuItem<String>(
                                  value: item.id.toString(),
                                  child: Text(
                                    item.fullName!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                                    .toList(),
                                    (value) {
                                  controller.Data!.studentId = int.parse(value!);
                                },
                              ),
                              controller.student_id),
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
                        fontWeight: FontWeight.bold, color: AppColors.card4),
                  )),
            ],
          ),
        ));
  }
}
