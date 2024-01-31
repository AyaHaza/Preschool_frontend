import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/project/web/Employee/view/Classes/ClassEdit.dart';

import '../../../../../CONSTANT/size_config.dart';
import '/CONSTANT/colors.dart';
import '../../Controller/Clasees/classController.dart';
import '../../Controller/Levels/LevelController.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import 'classD.dart';
import 'formDialog.dart';


class ClassManagementContent extends StatelessWidget {


  // @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Row(
          children: [
            Expanded(
                child: GetBuilder<ClassController>(
                  builder: (controller) =>  PaginatedDataTable(
                    columns: const [
                      DataColumn(label: Text('id')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Capacity') ,numeric: true),
                      DataColumn(label: Text('Level')),
                      DataColumn(label: Text('')),
                      DataColumn(label: Text('Edit')),
                      DataColumn(label: Text('Delete')),
                      DataColumn(label: Text('Show Details')),
                      DataColumn(label: Text('Show Students In Class')),

                    ],
                    showFirstLastButtons: true,
                    arrowHeadColor: Colors.cyanAccent,
                    source:  MyData(),
                    columnSpacing: 50,
                    horizontalMargin: 60,
                    headingRowHeight: 80,
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  ClassController controller = Get.find();
  LevelController controller1 = Get.find();

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(
          '${controller.Classes.values.elementAt(index).id}')),
      DataCell(Text(
          controller.Classes.values.elementAt(index).name!)),
      DataCell(Text(
          '${controller.Classes.values.elementAt(index).capacity}')),
      DataCell(Text(
          '${controller1.levels[controller.Classes.values.elementAt(index).levelId]!.name}')),
      DataCell(SizedBox(
        width: 20.w,
      )),
      DataCell(IconButton(
          onPressed: () =>Get.toNamed(ClassEdit.routeName,arguments: [controller.Classes.keys.elementAt(index)]),
          icon: const Icon(
            Icons.edit,
            color: AppColors.card1,
          ))),
      DataCell(IconButton(
          onPressed: () {controller.Delete(controller.Classes.values.elementAt(index).id!);},
          icon: const Icon(
            Icons.delete,
            color: AppColors.card2,
          ))),
      DataCell(IconButton(
          onPressed: () {
            Dialogs.Info(" Class Info ",classdialogDetail(id:index));
          },
          icon: Icon(
            Icons.arrow_circle_right_outlined,
            color: AppColors.iconGray,
          ))),
      DataCell(Container(
          width: 200,
          child:
          TextButton(
            onPressed: (){
              SizeConfig.id_Class=controller.Classes.values.elementAt(index).id.toString();
              Dialogs.InfoClass(" Studentes In Class ${controller.Classes.values.elementAt(index).name!}  ",classdi(id:controller.Classes.values.elementAt(index).id!));
            }, child: Text('Show Students'),

          )
      )
      ),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => controller.Classes.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
