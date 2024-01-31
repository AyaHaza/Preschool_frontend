import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/colors.dart';
import 'package:project/CONSTANT/size_config.dart';
import '../../../Controller/HomeWork/HomeworkContollerScreen.dart';
import '../../../Controller/HomeWork/HomeworkController.dart';

class EditHomeworkContent extends StatefulWidget {
    int?index;
  EditHomeworkContent({this.index});
  @override
  State<EditHomeworkContent> createState() => _EditHomeworkContentState();
}

class _EditHomeworkContentState extends State<EditHomeworkContent> {
  final formKey = GlobalKey<FormState>();

  HomeworkController homeworkController = Get.find();
 
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
      title:Text("Edit Homework") ,
    ),
    body:    Center(
      child: SingleChildScrollView(
        child: GetBuilder<HomeworkControllerScreen>(
            builder: (controller) => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Form(
                        key: formKey,
                        child: Wrap(
                          spacing:10.w,

                          children: <Widget>[
                            TextField1(

                                "Description",
                                TextFormField(
                                  initialValue: homeworkController.allHomeworks.values.elementAt(widget.index!).description,

                                  decoration: decoration(),
                                  onSaved: (value) {
                                    controller.EditedData!.description = value;
                                  },
                                ),
                                controller.descriptionMsg),
                            TextField1(
                              "Page Number",
                              TextFormField(
                                initialValue: homeworkController.allHomeworks.values.elementAt(widget.index!).page_number,

                                decoration: decoration(),
                                keyboardType: TextInputType.number,

                                onSaved: (value) {
                                  controller.EditedData!.page_number = value;
                                },
                              ),
                              controller.page_numberMsg,
                            ),
                             Container(
                                  height: 0,
                                  width: 0,
                                  child: TextField1(
                                                          "SubjectId",
                                                          TextFormField(
                                  decoration: decoration(),
                                  keyboardType: TextInputType.number,

                                  onSaved: (value) {
                                    controller.EditedData!.lesson_id = SizeConfig.id_Lesson;
                                  },
                                                          ),
                                                          '',
                                                        ),
                                ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      if (controller.isLoading)
                        CircularProgressIndicator()
                      else
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),),
                         color:  Colors.teal.withOpacity(0.4),
                          child: Text('Edit'),
                          onPressed: () {
                            if (!formKey.currentState!.validate()) {
                              return;
                            }
                            formKey.currentState!.save();
                            print(SizeConfig.id_Lesson);
                             controller.Edit(homeworkController.allHomeworks.values.elementAt(widget.index!).id!);
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
