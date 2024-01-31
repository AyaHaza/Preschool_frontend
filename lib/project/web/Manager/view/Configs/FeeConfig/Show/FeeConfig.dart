import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../CONSTANT/colors.dart';
import '../../../../Controller/Config/FeeConfigController.dart';
import '../../../../Model/FeeyearConfig.dart';
import '../Edit/ConfigEdit.dart';


class FeeManagementContent extends StatelessWidget {


  // @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Row(
          children: [
            Expanded(
                child: GetBuilder<FeeConfigController>(
                  builder: (controller) =>  PaginatedDataTable(
                    columns: const [
                      DataColumn(label: Text('year')),
                      DataColumn(label: Text('studyFees'),numeric: true),
                      DataColumn(label: Text('busFees') ,numeric: true),
                      DataColumn(label: Text('discountBus'),numeric: true),
                      DataColumn(label: Text('discountWithoutBus'),numeric: true),
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
  FeeConfigController controller = Get.find();

  @override
  DataRow? getRow(int index) {
    FeeYear fee=controller.FeeConfigs.values.elementAt(index);
    return DataRow(cells: [
      DataCell(Text(fee.year!)),
      DataCell(Text(fee.studyFees!)),
      DataCell(Text(fee.busFees!)),
      DataCell(Text(fee.discountBus!.toString())),
      DataCell(Text(fee.discountWithoutBus!.toString())),
      DataCell(SizedBox(
        width: 20.w,
      )),
      DataCell(IconButton(
          onPressed: () => Get.toNamed(YearConfigEdit.routeName,arguments: [controller.FeeConfigs.keys.elementAt(index)]),
          icon: const Icon(
            Icons.edit,
            color: AppColors.card1,
          ))),
      DataCell(IconButton(
          onPressed: () => controller.Delete(controller.FeeConfigs.values.elementAt(index).id!),
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
  int get rowCount => controller.FeeConfigs.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
