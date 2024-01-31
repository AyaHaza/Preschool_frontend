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

class FeefetchForm extends StatefulWidget {

  @override
  State<FeefetchForm> createState() => _FeefetchFormState();
}

class _FeefetchFormState extends State<FeefetchForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int? id;
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
                               id = int.parse(value!);
                                },
                              ),
                             ""),
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
                  child: Text('Get'),
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    formKey.currentState!.save();
                    controller.StudentFee(id!);
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
