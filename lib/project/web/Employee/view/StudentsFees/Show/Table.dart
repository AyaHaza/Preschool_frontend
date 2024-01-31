import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Controller/StudentFee/FeeController.dart';
import '../../../Controller/StudentMangement/StudentController.dart';
import '../../../Model/StudentFee.dart';
import '../../../Model/StudentsFee.dart';
import '../../../widgets/Dialogs/ErrorDialog.dart';
import '../../Classes/formDialog.dart';
import '../../../Controller/StudentMangement/StudentController.dart';
import '../../StudentMangement/StudentDital/StudentDialoge.dart';
import '../../StudentMangement/StudentEdit/StudentEdit.dart';
import '../../../Model/Student.dart';

class StudentsContent extends StatelessWidget {

  // @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Row(
          children: [
            Expanded(
                child: GetBuilder<FeeController>(
                  builder: (controller) =>  PaginatedDataTable(
                    columns:  [
                      DataColumn(label: Text('id')),
                      DataColumn(label: Text('name')),
                      DataColumn(label: Text('fees')),
                      DataColumn(label: Text('remind')),
                      DataColumn(label: Text('currentAmount')),
                      DataColumn(label: Text('busFees')),
                      DataColumn(label: Text('studyDiscount')),
                      DataColumn(label: Text('busDiscount')),
                      DataColumn(label: Text('status')),
                    ],
                    showFirstLastButtons: true,
                    arrowHeadColor: Colors.cyanAccent,
                    source:  MyData(StudentFee: controller.StudentFeepage.values.toList()),
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

  List<Fees> StudentFee =[];
  MyData({required this.StudentFee});
  @override
  DataRow? getRow(int index) {

    return DataRow(cells: [
      DataCell(Text(
          '${StudentFee[index]!.id}')),
    DataCell(Text(
    '${StudentFee[index]!.name}')),
    DataCell(Text(
    '${StudentFee[index]!.fees}')),
    DataCell(Text(
    '${StudentFee[index]!.remind}')),
    DataCell(Text(
    '${StudentFee[index]!.currentAmount}')),
    DataCell(Text(
    '${StudentFee[index]!.busFees}')),
    DataCell(Text(
    '${StudentFee[index]!.studyDiscount}')),
    DataCell(Text(
    '${StudentFee[index]!.busDiscount}')),
    DataCell(Text(
    '${StudentFee[index]!.status}')),

    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount =>StudentFee.length ;
  // int get rowCount =>1;
  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
