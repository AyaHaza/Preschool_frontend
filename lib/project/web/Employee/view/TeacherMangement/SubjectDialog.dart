import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/Subject/TeavcherSubject.dart';

class SubjectDialog extends StatefulWidget {
  int ?id;
  SubjectDialog({ this.id});

  @override
  State<SubjectDialog> createState() => _SubjectDialogState();
}

class _SubjectDialogState extends State<SubjectDialog> {
  TeacherSubjectController controller =Get.put(TeacherSubjectController(),permanent: false);

 // ClassController controllerClass=Get.find();

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 1500,
        height: 500,
        child: GetBuilder<TeacherSubjectController>(
            builder: (controller2)
            {return
              ListView.builder(

                  itemCount:controller.Subjects.values.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Card(
                      child: ListTile(
                          title: Text('${controller.Subjects.values.elementAt(index).name}',style: TextStyle(color: Color(0XFF222222)),),
                          subtitle: Text('${controller.Subjects.values.elementAt(index).id}'),
                          trailing:IconButton(onPressed: (){
                           controller.Delete(controller.Subjects.values.elementAt(index).id!);
                            },
                            icon: Icon(Icons.delete, color: Color(0XFFED5A48),),)
                      ),
                    );
                  });

            }),
      );
  }
}
