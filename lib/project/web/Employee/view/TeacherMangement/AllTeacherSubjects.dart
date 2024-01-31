import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../CONSTANT/colors.dart';

import '../../../../../CONSTANT/size_config.dart';
import '../../Controller/TeacherMangenent/AllTeacherController.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import 'AddClasses.dart';
import 'AddaTecherSubject.dart';
import 'Clases.dart';
import 'ClasesDialog.dart';
import 'SubjectDialog.dart';


class TeacherManagementContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Row(
          children: [
            Expanded(
                child: PaginatedDataTable(
                  columns: const [
                    DataColumn(label: Text('id')),
                    DataColumn(label: Text('Name')),

                    DataColumn(label: Text('             Classes')),
                   DataColumn(label: Text('              Subjectes')),
                    DataColumn(label: Text('Add Subject')),
                  ],
                  showFirstLastButtons: true,
                  arrowHeadColor: Colors.cyanAccent,
                  source:  MyData(),
                  columnSpacing: 50,
                  horizontalMargin: 60,
                  headingRowHeight: 80,
                )
            )
          ],
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
   AllTeacherController controller = Get.find();
  //
  // //TeacherSubjectController controllerSubject=Get.find();
  @override
  DataRow? getRow(int index) {

    SizeConfig.id_Teacher=controller.AllTeachers.values.elementAt(index).id.toString();
  //  SizeConfig.id_ClassSub=controller.AllTeachers.values.elementAt(index).class_id.toString();
    // SizeConfig.id_Teacher.add(controller.AllTeachers.values.elementAt(index).id);
   // TeacherClassesController controllerClasses=Get.put(TeacherClassesController());

   // AllTeacherController controller = Get.find();
   // print(SizeConfig.id_Teacher);
    return DataRow(cells: [
      DataCell(Text(

          '${controller.AllTeachers.values.elementAt(index).id}')),
      DataCell(Text(
          controller.AllTeachers.values.elementAt(index).fullName!)),


      DataCell(
Container(
          width: 200,
          child:
          TextButton(
            onPressed: (){
              SizeConfig.id_Teacher=controller.AllTeachers.values.elementAt(index).id.toString();
              // SizeConfig.id_ClassSub=controller.AllTeachers.values.elementAt(index).class_id.toString();
             // SizeConfig.id_Teacher=controller.AllTeachers.values.elementAt(index).id.toString();
              Dialogs.Info(" Show Classes ${controller.AllTeachers.values.elementAt(index).fullName!}  ",ClssesDialog(id:controller.AllTeachers.values.elementAt(index).id));}, child: Text('Show Classes'),

          )
      )),



      DataCell(Container(
          width: 200,
          child:
          TextButton(
            onPressed: (){
              SizeConfig.id_Teacher=controller.AllTeachers.values.elementAt(index).id.toString();
          //    SizeConfig.id_ClassSub=controller.AllTeachers.values.elementAt(index).class_id.toString();
             // SizeConfig.id_Teacher=controller.AllTeachers.values.elementAt(index).id.toString();
              Dialogs.InfoAddTecherClassest("Classes  ",TecherClassesDialog(id:index));
             }, child: Text('Show Subjects'),

          )
      )
      ),
      DataCell(IconButton(
          onPressed: () {
            SizeConfig.id_Teacher=controller.AllTeachers.values.elementAt(index).id.toString();
            //SizeConfig.id_ClassSub=controller.AllTeachers.values.elementAt(index).class_id.toString();
            Dialogs.InfoAddTecherClassest("Classes  ",AddTecherClassesDialog(id:index));

            //  controller.Delete(controller.Subjects.values.elementAt(index).id!);
            },
          icon: const Icon(
            Icons.add_circle_rounded,
            color:Colors.greenAccent,
          ))),
    
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => controller.AllTeachers.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
