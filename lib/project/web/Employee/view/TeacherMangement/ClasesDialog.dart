

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../CONSTANT/size_config.dart';
import '../../Controller/TeacherMangenent/TeacherClasesController.dart';


class ClssesDialog extends StatefulWidget {
  int ?id;
  ClssesDialog({ this.id});

  @override
  State<ClssesDialog> createState() => _ClssesDialogState();
}

class _ClssesDialogState extends State<ClssesDialog> {
  TeacherClassesController controller =Get.put(TeacherClassesController(),permanent: false);

 // ClassController controllerClass=Get.find();

  @override
  Widget build(BuildContext context) {
    print(widget.id)
;    return
      Container(
        width: 1500,
        height: 500,
        child: GetBuilder<TeacherClassesController>(
            builder: (controller2)
            {return
              ListView.builder(

                  itemCount:controller.teacherClasses.values.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Card(
                      child: ListTile(
                          title: Text('${controller.teacherClasses.values.elementAt(index).name}',style: TextStyle(color: Color(0XFF222222)),),
                          subtitle: Text('${controller.teacherClasses.values.elementAt(index).capacity}'),
                          trailing:IconButton(onPressed: (){
                            SizeConfig.id_ClassSub=controller.teacherClasses.values.elementAt(index).id.toString();
                           controller.Delete(widget.id!);
                            },
                            icon: Icon(Icons.delete, color: Color(0XFFED5A48),),)
                      ),
                    );
                  });

            }),
      );
  }
}
