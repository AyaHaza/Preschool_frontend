import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/CONSTANT/colors.dart';
import '../../Controller/Levels/LevelController.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import 'FormDialog.dart';
import 'LevelEdit.dart';

class LevelManagementContent extends StatelessWidget {


  // @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: GetBuilder<LevelController>(
          builder: (controller) =>  PaginatedDataTable(
                columns: const [
                  DataColumn(label: Text('id')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Age') ,numeric: true),
                  DataColumn(label: Text('') ,numeric: true),
                  DataColumn(label: Text('Edit')),
                  DataColumn(label: Text('Delete')),
                  DataColumn(label: Text('Show Details')),
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
  LevelController controller = Get.find();
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(
          '${controller.levels.values.elementAt(index).id}')),
      DataCell(Text(
          controller.levels.values.elementAt(index).name!)),
      DataCell(Text(
          '${controller.levels.values.elementAt(index).age}')),
      DataCell(SizedBox(
        width: 400,
      )),
      DataCell(IconButton(
          onPressed: () =>Get.toNamed(LevelEdit.routeName,arguments: [controller.levels.keys.elementAt(index)]),
          icon: const Icon(
            Icons.edit,
            color: AppColors.card1,
          ))),
      DataCell(IconButton(
          onPressed: () {controller.Delete(controller.levels.values.elementAt(index).id!);},
          icon: const Icon(
            Icons.delete,
            color: AppColors.card2,
          ))),
      DataCell(IconButton(
          onPressed: () {
            Dialogs.Info(" Leve Info ",dialogDetail(id:index));
          },
          icon: Icon(
            Icons.arrow_circle_right_outlined,
            color: AppColors.iconGray,
          ))),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => controller.levels.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
