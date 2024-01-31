import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/CONSTANT/colors.dart';
import '../../../Controller/StudentMangement/StudentController.dart';
import '../../../widgets/Dialogs/ErrorDialog.dart';
import '../../Classes/formDialog.dart';
import '../../../Controller/StudentMangement/StudentController.dart';
import '../../StudentMangement/StudentDital/StudentDialoge.dart';
import '../../StudentMangement/StudentEdit/StudentEdit.dart';
import '../../../Model/Student.dart';

class BusStudentsContent extends StatelessWidget {

  int id;
  BusStudentsContent({required this.id});
  // @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Row(
          children: [
            Expanded(
                child: GetBuilder<StudentController>(
                  builder: (controller) =>  PaginatedDataTable(
                    columns: const [
                      //   DataColumn(label: Text('id')),
                      DataColumn(label: Text('fullName')),
                      DataColumn(label: Text('motherName')),
                      DataColumn(label: Text('motherNameLast')),
                      DataColumn(label: Text('Gender')),

                      DataColumn(label: Text('birthday')),
                      //  DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Location')),
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
  StudentController controller = Get.find();
//  LevelController controller1 = Get.find();
  int id;
  MyData({required this.id});

  @override
  DataRow? getRow(int index) {

    // print(controller.Classes.values.elementAt(0).bus_id);
    // print(id);
    // print(controller.Classes.values.elementAt(0).bus_id==id);
    // controller.Classes.values.forEach((element) {print(element.bus_id);});
    List<Student> busStudent=controller.Classes.values.where((element) => element.bus_id!.compareTo(id.toString())==0).toList();

    return DataRow(cells: [
      DataCell(Text(
          '${busStudent.elementAt(index).fullName}')),
      DataCell(Text(
          '${busStudent.elementAt(index).motherName}')),
      DataCell(Text(
          '${busStudent.elementAt(index).motherLastName}')),

      DataCell(Text(
          '${busStudent.elementAt(index).gender}')),
      DataCell(Text(
          '${busStudent.elementAt(index).birthday}')),
      DataCell(Text(
          '${busStudent.elementAt(index).location}')),

    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => controller.Classes.values.where((element) => element.bus_id!.compareTo(id.toString())==0).toList().length;
  // int get rowCount =>1;
  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
