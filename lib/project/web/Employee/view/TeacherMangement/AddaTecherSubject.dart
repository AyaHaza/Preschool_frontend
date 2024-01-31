import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../CONSTANT/size_config.dart';
import '../../Controller/Clasees/classController.dart';
import '../../Controller/StudentClasses/unStudentClassesController.dart';
import '../../Controller/Subject/SubjectController.dart';
import '../../Model/StudentClasses.dart';


class AddTecherSubjectDialog extends StatefulWidget {
  int ?id;
  AddTecherSubjectDialog({ this.id});

  @override
  State<AddTecherSubjectDialog> createState() => _AddTecherSubjectDialogState();
}

class _AddTecherSubjectDialogState extends State<AddTecherSubjectDialog> {
  SubjectController controller = Get.put(SubjectController());

  List<StudentClasses>selectStudentes=[];

  List<int> isSleceted=[];

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 1500,
        height: 500,
        child: GetBuilder<SubjectController>(
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
                            setState(() {final isSlecd=isSleceted.contains(controller.Subjects.values.elementAt(index).id);
                            setState(() {
                              isSlecd?isSleceted.remove(controller.Subjects.values.elementAt(index).id)
                                  :isSleceted.add(controller.Subjects.values.elementAt(index).id!);
                            });
                              // isSleceted.contains(controller.unStudenClass.values.elementAt(index).id)=! controller.isSWSlect;

                            });                       SizeConfig.id_Subject_Add=isSleceted;  print(isSleceted); },
                            icon:
                            isSleceted.contains(controller.Subjects.values.elementAt(index).id)?Icon(Icons.check_box, color: Colors.greenAccent,)
                                :
                            Icon(Icons.check_box_outline_blank, color: Color(0XFFED5A48),),)
                      ),
                    );
                  });

            }),
      );
  }


}
