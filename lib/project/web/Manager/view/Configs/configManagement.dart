import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../CONSTANT/colors.dart';
import '../../Controller/Config/ConfigController.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import 'ConfigEdit.dart';


class ConfigManagementContent extends StatelessWidget {


  // @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Row(
          children: [
            Expanded(
                child: GetBuilder<ConfigController>(
                  builder: (controller) =>  PaginatedDataTable(
                    columns: const [
                      DataColumn(label: Text('id')),
                      DataColumn(label: Text('Amount')),
                      DataColumn(label: Text('Date') ,numeric: true),
                      DataColumn(label: Text('')),
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
  ConfigController controller = Get.find();

  @override
  DataRow? getRow(int index) {
    DateTime date=controller.Configs.values.elementAt(index).date!;
    return DataRow(cells: [
      DataCell(Text(
          '${controller.Configs.values.elementAt(index).id}')),
      DataCell(Text(
          controller.Configs.values.elementAt(index).amount.toString()!)),
      DataCell(Text(
          "${date.month}/${date.day}/${date.year}")),

      DataCell(SizedBox(
        width: 20.w,
      )),
      DataCell(IconButton(
          onPressed: () =>Get.toNamed(ConfigEdit.routeName,arguments: [controller.Configs.keys.elementAt(index)]),
          icon: const Icon(
            Icons.edit,
            color: AppColors.card1,
          ))),
      DataCell(IconButton(
          onPressed: () => controller.Delete(controller.Configs.values.elementAt(index).id!),
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
  int get rowCount => controller.Configs.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
