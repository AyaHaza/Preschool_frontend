import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/CONSTANT/colors.dart';
import '../../../Controller/Bus/BusController.dart';
import '../../../widgets/Dialogs/ErrorDialog.dart';
import '../BusEdit/BusEdit.dart';
import '../BusStudents/BusStudentsall.dart';

class BusManagementContent extends StatelessWidget {


  // @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Row(
          children: [
            Expanded(
                child: GetBuilder<BusController>(
                  builder: (controller) =>  PaginatedDataTable(
                    columns: const [
                                DataColumn(label: Text('id')),
                              DataColumn(label: Text('capacity')),
                              DataColumn(label: Text('number')),
                              DataColumn(label: Text('bus_supervisor_id')),
                              DataColumn(label: Text('Edit')),
                              DataColumn(label: Text('Delete')),
                              DataColumn(label: Text('Students')),

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
  BusController controller = Get.find();
//  LevelController controller1 = Get.find();

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(
          '${controller.Buses.values.elementAt(index).id}')),
     DataCell(Text(
              '${controller.Buses.values.elementAt(index).capacity}')),
          DataCell(Text(
              '${controller.Buses.values.elementAt(index).number}')),
          DataCell(Text(
            '${controller.Buses.values.elementAt(index).bus_supervisor_id}')),
          DataCell(IconButton(
          onPressed: () {
             Get.toNamed(BusEdit.routeName,arguments: [controller.Buses.keys.elementAt(index)]);
            },
          icon: const Icon(
            Icons.edit,
            color: AppColors.card1,
          ))),
      DataCell(IconButton(
          onPressed: () {
            print(controller.Buses.values.elementAt(index).id!);
           //  controller.DeleteEmp(controller.Classes.values.elementAt(index).id!);
             Get.defaultDialog(
                 title: "Do you want to Delete it ?",
                 middleText:"",
              buttonColor: Colors.red,
                    confirmTextColor: Colors.white,
                    cancelTextColor: Colors.red,
                    textConfirm: 'yes',
                    textCancel: 'no',
                    onConfirm: () {
                      controller.Delete(controller.Buses.values.elementAt(index).id!);
                      Get.back();

                    },onCancel: (){
               Get.back();
             }
            );
          },
          icon: const Icon(
            Icons.delete,
            color: AppColors.card2,
          ))),
      DataCell(IconButton(
          onPressed: () {
             Get.toNamed(BusStudents.routeName,arguments: [controller.Buses.values.elementAt(index).id]);
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
  int get rowCount => controller.Buses.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
