import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../CONSTANT/colors.dart';
import '../../Controller/Report/Report.dart' as R;
import '../../Model/Report.dart'as S;


class Content extends StatelessWidget {

  // @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Row(
          children: [
            Expanded(
                child: GetBuilder<R.ReportController>(
                  builder: (controller) =>  PaginatedDataTable(
                    columns:  [
                      DataColumn(label: Text('fileName')),
                      DataColumn(label: Text('type')),
                      DataColumn(label: Text('open')),
                    ],
                    showFirstLastButtons: true,
                    arrowHeadColor: Colors.cyanAccent,
                    source:  MyData(Report: controller.ReportA.values.toList()),
                    columnSpacing: 50,
                    // headingRowHeight: 80,
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
  R.ReportController controller =Get.find();
  List<S.Report> Report =[];
  MyData({required this.Report});
  @override
  DataRow? getRow(int index) {

    return DataRow(cells: [
      DataCell(Text(
          '${Report[index]!.fileName}')),
    DataCell(Text(
    '${Report[index]!.type}')),
      DataCell(IconButton(
          onPressed: () => controller.open(index),
          icon: const Icon(
            Icons.open_in_browser,
            color: AppColors.card1,
          ))),

    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount =>Report.length ;
  // int get rowCount =>1;
  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
