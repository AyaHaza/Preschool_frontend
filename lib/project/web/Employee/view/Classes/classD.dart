import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../CONSTANT/size_config.dart';
import '../../Controller/StudentClasses/StudentClassesControllker.dart';
import '../../Controller/Clasees/classController.dart';


class classdi extends StatefulWidget {
  int ?id;
  classdi({ this.id});

  @override
  State<classdi> createState() => _classdiState();
}

class _classdiState extends State<classdi> {
  StudentClassesController controller =Get.put(StudentClassesController(),permanent: false);

  ClassController controllerClass=Get.find();

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 1500,
        height: 500,
        child: GetBuilder<StudentClassesController>(
            builder: (controller2)
            {return
              ListView.builder(

                  itemCount:controller.StudenClass.values.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Card(
                      child: ListTile(
                          title: Text('${controller.StudenClass.values.elementAt(index).name}',style: TextStyle(color: Color(0XFF222222)),),
                          subtitle: Text('${controller.StudenClass.values.elementAt(index).id}'),
                          trailing:IconButton(onPressed: (){
                            SizeConfig.id_student=controller.StudenClass.values.elementAt(index).id.toString();
                            controller.Delete(widget.id!);},
                            icon: Icon(Icons.delete, color: Color(0XFFED5A48),),)
                      ),
                    );
                  });

            }),
      );
  }
}
