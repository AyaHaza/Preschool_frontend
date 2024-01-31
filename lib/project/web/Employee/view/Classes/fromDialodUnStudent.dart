import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../CONSTANT/size_config.dart';
import '../../Controller/Clasees/classController.dart';
import '../../Controller/StudentClasses/unStudentClassesController.dart';
import '../../Model/StudentClasses.dart';


class unStudentclassdialogDetail extends StatefulWidget {
  int ?id;
  unStudentclassdialogDetail({ this.id});

  @override
  State<unStudentclassdialogDetail> createState() => _unStudentclassdialogDetailState();
}

class _unStudentclassdialogDetailState extends State<unStudentclassdialogDetail> {
  unStudentClassesController controller =Get.put(unStudentClassesController());

  ClassController controllerClass=Get.find();

  List<StudentClasses>selectStudentes=[];

  List<int> isSleceted=[];

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 1500,
        height: 500,
        child: GetBuilder<unStudentClassesController>(
            builder: (controller2)
            {return
              ListView.builder(

                  itemCount:controller.unStudenClass.values.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Card(
                      child: ListTile(
                          title: Text('${controller.unStudenClass.values.elementAt(index).name}',style: TextStyle(color: Color(0XFF222222)),),
                          subtitle: Text('${controller.unStudenClass.values.elementAt(index).id}'),
                          trailing:IconButton(onPressed: (){
                            setState(() {final isSlecd=isSleceted.contains(controller.unStudenClass.values.elementAt(index).id);
                            setState(() {
                              isSlecd?isSleceted.remove(controller.unStudenClass.values.elementAt(index).id)
                                  :isSleceted.add(controller.unStudenClass.values.elementAt(index).id!);
                            });
                              // isSleceted.contains(controller.unStudenClass.values.elementAt(index).id)=! controller.isSWSlect;

                            });                       SizeConfig.id_Stud_Add=isSleceted;  print(isSleceted); },
                            icon:
                            isSleceted.contains(controller.unStudenClass.values.elementAt(index).id)?Icon(Icons.check_box, color: Colors.greenAccent,)
                                :
                            Icon(Icons.check_box_outline_blank, color: Color(0XFFED5A48),),)
                      ),
                    );
                  });

            }),
      );
  }


}
