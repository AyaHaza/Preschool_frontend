import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/colors.dart';
import 'package:project/CONSTANT/size_config.dart';
import 'package:project/project/Bus_supervisor/widgets/EditPage/DropDown.dart';
import '../../../Controller/HomeWork/HomeworkController.dart';
import '../../../Controller/Lessons/LessonsController.dart';
import '../../../Controller/Lessons/LessonsControllerScreen.dart';
import '../../../Model/AllLessons.dart';

class EditLessonContent extends StatefulWidget {
    int?index;
    int?classid;
    List<AllLesson>?  SubjectLesson =[];

    EditLessonContent({required this.index, required this.SubjectLesson,required this.classid});
  @override
  State<EditLessonContent> createState() => _EditLessonContentState();
}

class _EditLessonContentState extends State<EditLessonContent> {
  final formKey = GlobalKey<FormState>();
  LessonsController lessonController = Get.find();
  final List<String>  semesterLessoon = [
    's1',
    's2',
  ];
  final List<String>  Status = [
    'given',
    'ungiven',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      centerTitle: true,
      elevation: 1,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 19),
      title:Text("Edit Lessons") ,
    ),
    body:    Center(
      child: SingleChildScrollView(
        child: GetBuilder<LessonsControllerScreen>(
            builder: (controller) => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10.h,),
                      Form(
                        key: formKey,
                        child: Wrap(
                          // spacing:10.w,

                          children: <Widget>[
                            TextField1(

                                "Title",
                                TextFormField(
                                  initialValue: widget.SubjectLesson![widget.index!].title,

                                  decoration: decoration(),
                                  onSaved: (value) {
                                    controller.EditedData!.title = value;
                                  },
                                ),
                                controller.titleMsg),
                            TextField1(
                              "Number",
                              TextFormField(
                                initialValue: widget.SubjectLesson![widget.index!].number,

                                decoration: decoration(),
                                keyboardType: TextInputType.number,

                                onSaved: (value) {
                                  controller.EditedData!.number = value;
                                },
                              ),
                              controller.numberMsg,
                            ),
                            TextField1(
                                'Semester',
                                DropDown(
                                  '${widget.SubjectLesson![widget.index!].semester!}',
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
                                    controller.EditedData!.semester = value;
                                  },
                                ),
                                controller.semesterMsg),
                            TextField1(
                                'Status',
                                DropDown(
                                  '${widget.SubjectLesson![widget.index!].status!}',
                                  Status
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
                                    controller.EditedData!.status = value;
                                  },
                                ),
                                ""),
                                Container(
                                  height: 0,
                                  width: 0,
                                  child: TextField1(
                                                          "SubjectId",
                                                          TextFormField(
                                  decoration: decoration(),
                                  keyboardType: TextInputType.number,

                                  onSaved: (value) {
                                    controller.EditedData!.subject_id =widget.SubjectLesson![widget.index!].subject_id ;
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
                          color: Colors.teal.withOpacity(0.4),

                          child: Text('Edit'),
                          onPressed: () {
                            if (!formKey.currentState!.validate()) {
                              return;
                            }
                            formKey.currentState!.save();
                            // print(lessonController.allLessons.values.elementAt(widget.index!).id);
                            controller.Edit(widget.SubjectLesson![widget.index!].id!,widget.classid!);
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
          padding: EdgeInsets.symmetric( horizontal: 6),
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
                  height: 30.h,
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
