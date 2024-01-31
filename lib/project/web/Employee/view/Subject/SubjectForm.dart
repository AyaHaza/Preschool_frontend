import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../widgets/EditPage/DropDown.dart';
import '/CONSTANT/colors.dart';
import '../../Controller/Clasees/class_Screen.dart';
import '../../Controller/Levels/LevelController.dart';
import '../../Controller/Subject/Subject_screen.dart';


class SubjectForm extends StatefulWidget {

  @override
  State<SubjectForm> createState() => _SubjectFormState();
}

class _SubjectFormState extends State<SubjectForm> {
  final formKey = GlobalKey<FormState>();

  LevelController levelController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubjectControllerScreen>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: formKey,
                child: Wrap(
                  children: <Widget>[
                    TextField1(
                        "Name",
                        TextFormField(
                          decoration: decoration(),
                          validator: (value) {
                            if (value==null || !value.isAlphabetOnly) {
                              return 'Invalid class rname should be not empty and alphabet!';
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
                        'Level',
                        DropDown(
                          'Select class Level',
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
                            controller.Data!.level_id = int.parse(value!);
                          },
                        ),
                        controller.levelMsg),

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
