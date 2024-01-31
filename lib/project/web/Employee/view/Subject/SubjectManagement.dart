import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/CONSTANT/colors.dart';
import '../../Controller/Levels/LevelController.dart';
import '../../Controller/Subject/SubjectController.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import 'SubjectEdit.dart';


class SubjectManagementContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Row(
          children: [
            Expanded(
                child: GetBuilder<SubjectController>(
                  builder: (controller) =>  PaginatedDataTable(
                    columns: const [
                      DataColumn(label: Text('id')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('level')),
                      DataColumn(label: Text('') ,numeric: true),
                      DataColumn(label: Text('Edit')),
                      DataColumn(label: Text('Delete')),
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
  SubjectController controller = Get.find();
  LevelController levelController = Get.find();

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(
          '${controller.Subjects.values.elementAt(index).id}')),
      DataCell(Text(
          controller.Subjects.values.elementAt(index).name!)),
      DataCell(Text(
         levelController.levels[ controller.Subjects.values.elementAt(index).level_id!]!.name!)),
      DataCell(SizedBox(
        width: 400,
      )),
      DataCell(IconButton(
          onPressed: () =>Get.toNamed(SubjectEdit.routeName,arguments: [controller.Subjects.keys.elementAt(index)]),
          icon: const Icon(
            Icons.edit,
            color: AppColors.card1,
          ))),
      DataCell(IconButton(
          onPressed: () {controller.Delete(controller.Subjects.values.elementAt(index).id!);},
          icon: const Icon(
            Icons.delete,
            color: AppColors.card2,
          ))),

    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => controller.Subjects.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
