import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../CONSTANT/colors.dart';
import '../../../Controller/Attendance/Attendance.dart';
import '../../Template.dart';

class ALLStudents extends StatelessWidget {
  static const routeName = '/Absence';


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Template(
        title: "Absence Information",
        body: SingleChildScrollView(
          child: Center(
            child: Row(
              children: [
                SizedBox(
                  height: 400.h,
                  width: 400.w,
                  child: PaginatedDataTable(
                    columns: const [
                      DataColumn(label: Text('fullName')),
                      DataColumn(label: Text('date')),
                      DataColumn(label: Text('justification')),
                    ],
                    showFirstLastButtons: true,
                    arrowHeadColor: Colors.cyanAccent,
                    source: MyData(),
                    columnSpacing: 10,
                    horizontalMargin: 0,
                    headingRowHeight: 80,
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
class MyData extends DataTableSource {
  AttendanceController controller = Get.find();
  @override
  DataRow? getRow(int index) {
    DateTime date=controller.AbsentStudents.elementAt(index).date!;

    return DataRow(cells: [
      DataCell(Text(
          '${controller.AbsentStudents.elementAt(index).fullName}')),
      DataCell(Text(
          "${date.month}/${date.day}/${date.year}")),
      DataCell(Text(
          '${controller.AbsentStudents.elementAt(index).justification ?? ""}')),

    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => controller.AbsentStudents.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
