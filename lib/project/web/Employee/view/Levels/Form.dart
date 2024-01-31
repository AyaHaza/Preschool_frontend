import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/CONSTANT/colors.dart';
import '/CONSTANT/responsive.dart';
import '../../Controller/Levels/Level_Screen.dart';


class LevelForm extends StatefulWidget {
  @override
  State<LevelForm> createState() => _LevelFormState();
}

class _LevelFormState extends State<LevelForm> {
  LevelControllerScreen controller =Get.find();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LevelControllerScreen>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: formKey,
                child: Wrap(
                  direction:   (Responsive.isMobile(context)) ?Axis.vertical : Axis.horizontal,

                  children: <Widget>[
                    TextField1(
                        "Name",
                        TextFormField(
                          decoration: decoration(),
                          validator: (value) {
                            if (value==null || !value.isAlphabetOnly) {
                              return 'Invalid level name should be not empty and alphabet!';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            controller.Data!.name = value;
                          },
                        ),
                        controller.nameMsg
                    ),
                    TextField1(
                      "Age",
                      TextFormField(
                        decoration: decoration(),
                        validator: (value) {
                          if (value==null || !value.isNumericOnly) {
                            return 'Invalid level age should be not empty and numeric!';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controller.Data!.age = int.parse(value!);
                        },
                      ),
                      controller.ageMsg,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h,),
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
              SizedBox( height: 23.h,),
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

  Widget TextField1(String label, Widget text ,String error) {
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
              SizedBox(height :50.h,child: text),
              SizedBox(height :40.h,child: Text(error,style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.card1),)),
            ],
          ),
        ));
  }
}
