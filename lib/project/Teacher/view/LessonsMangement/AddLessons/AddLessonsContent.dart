import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/colors.dart';
import 'package:project/CONSTANT/size_config.dart';
import 'package:project/project/Bus_supervisor/widgets/EditPage/DropDown.dart';
import '../../../Controller/Lessons/LessonsController.dart';
import '../../../Controller/Lessons/LessonsControllerScreen.dart';

class AddLessonForm extends StatefulWidget {
  @override
  State<AddLessonForm> createState() => _AddLessonFormState();
}

class _AddLessonFormState extends State<AddLessonForm> {
  final formKey = GlobalKey<FormState>();

  LessonsController levelController = Get.find();
  final List<String>  semesterLessoon = [
    's1',
    's2',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:  AppBar(
      centerTitle: true,
      elevation: 1,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 19),
      title:Text("Add Lessons") ,
    ),
    body:    Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<LessonsControllerScreen>(
              builder: (controller) => SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        SizedBox(height: 10.h,),
                        Form(
                          key: formKey,
                          child: Wrap(

                            children: <Widget>[
                              TextField1(
                                  "Title",
                                  TextFormField(
                                    decoration: decoration(),
                                    onSaved: (value) {
                                      controller.Data!.title = value;
                                    },
                                  ),
                                  controller.titleMsg),
                              TextField1(
                                "Number",
                                TextFormField(
                                  decoration: decoration(),
                                  keyboardType: TextInputType.number,

                                  onSaved: (value) {
                                    controller.Data!.number = value;
                                  },
                                ),
                                controller.numberMsg,
                              ),
                              TextField1(
                                  'Semester',
                                  DropDown(
                                    'Select semester Lesson',
                                 semesterLessoon
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
                                      controller.Data!.semester = value;
                                    },
                                  ),
                                  controller.semesterMsg),
                                  Container(
                                    height: 0,
                                    width: 0,
                                    child: TextField1(
                                                            "SubjectId",
                                                            TextFormField(
                                    decoration: decoration(),
                                    keyboardType: TextInputType.number,

                                    onSaved: (value) {
                                      controller.Data!.subject_id = SizeConfig.id_Sub_Lesson;
                                    },
                                                            ),
                                                            '',
                                                          ),
                                  ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        if (controller.isLoading)
                          CircularProgressIndicator()
                        else
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),),
                            color:Colors.teal.withOpacity(0.4) ,
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
                  )),
        ),
      ),
    ),
   );
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
          padding: EdgeInsets.symmetric(horizontal: 6),
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
