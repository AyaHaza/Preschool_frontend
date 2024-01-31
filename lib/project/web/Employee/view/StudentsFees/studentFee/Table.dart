import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Controller/StudentFee/FeeController.dart';
import '../../../Controller/StudentMangement/StudentController.dart';
import '../../../Model/StudentFee.dart';
import '../../../widgets/Dialogs/ErrorDialog.dart';
import '../../Classes/formDialog.dart';
import '../../../Controller/StudentMangement/StudentController.dart';
import '../../StudentMangement/StudentDital/StudentDialoge.dart';
import '../../StudentMangement/StudentEdit/StudentEdit.dart';
import '../../../Model/Student.dart';

class FeeStudentsContent extends StatelessWidget {

  int id;
  FeeStudentsContent({required this.id});
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
                    columns: const [
                      DataColumn(label: Text('id')),
                      DataColumn(label: Text('amount')),
                      DataColumn(label: Text('remaind')),
                      DataColumn(label: Text('Fee entered employee name')),
                    ],
                    showFirstLastButtons: true,
                    arrowHeadColor: Colors.cyanAccent,
                    source:  MyData(id:id),
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
  FeeController controller = Get.find();
  int id;
  MyData({required this.id});

  @override
  DataRow? getRow(int index) {

    // print(controller.Classes.values.elementAt(0).bus_id);
    // print(id);
    // print(controller.Classes.values.elementAt(0).bus_id==id);
    // controller.Classes.values.forEach((element) {print(element.bus_id);});
    List<Fee> fees=controller.StudentFee.values.toList();
    return DataRow(cells: [
      DataCell(Text(
          '${fees.elementAt(index).id}')),
      DataCell(Text(
          '${fees.elementAt(index).amount}\$')),
      DataCell(Text(
          '${fees.elementAt(index).remaind}\$')),
      DataCell(Text(
          '${fees.elementAt(index).employee_name}')),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount =>controller.StudentFee.length;
  // int get rowCount =>1;
  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
