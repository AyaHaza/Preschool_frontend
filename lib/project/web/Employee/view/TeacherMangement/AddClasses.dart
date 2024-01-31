import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../CONSTANT/size_config.dart';
import '../../Controller/Clasees/classController.dart';

import '../../Model/StudentClasses.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import 'AddaTecherSubject.dart';


class AddTecherClassesDialog extends StatefulWidget {
  int ?id;
  AddTecherClassesDialog({ this.id});

  @override
  State<AddTecherClassesDialog> createState() => _AddTecherClassesDialogState();
}

class _AddTecherClassesDialogState extends State<AddTecherClassesDialog> {
  ClassController controller = Get.put(ClassController());



  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 1500,
        height: 500,
        child: GetBuilder<ClassController>(
            builder: (controller2)
            {return
              ListView.builder(

                  itemCount:controller.Classes.values.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Card(
                      child: ListTile(
                          title: Text('${controller.Classes.values.elementAt(index).name}',style: TextStyle(color: Color(0XFF222222)),),
                          subtitle: Text('${controller.Classes.values.elementAt(index).capacity}'),
                          trailing:IconButton(onPressed: (){
                             SizeConfig.id_ClassSub=controller.Classes.values.elementAt(index).id.toString();
 Dialogs.InfoAddTecherStudent(" Subject In Class ${controller.Classes.values.elementAt(index).name!}  ",AddTecherSubjectDialog(id:index));

                            },
                            icon:
                            Icon(Icons.arrow_circle_right, color: Color(0XFFED5A48),),)
                      ),
                    );
                  });

            }),
      );
  }


}
// Dialogs.Info("Show Subjects  ${controller.AllTeachers.values.elementAt(index).fullName!}  ",SubjectDialog(id:index));