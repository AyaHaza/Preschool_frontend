import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../CONSTANT/colors.dart';
import '../../../Controller/RegestryMangement/RegisteryController.dart';
import '../../../widgets/Dialogs/ErrorDialog.dart';
import '../RegisteryDital/DeleRegisteryDialog.dart';
import '../RegisteryEdit/RegisteryEdit.dart';



class RegisteryManagementContent extends StatelessWidget {


  // @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Row(
          children: [
            Expanded(
                child: GetBuilder<RegisteryController>(
                  builder: (controller) =>  PaginatedDataTable(
                    columns: const [
                              //   DataColumn(label: Text('id')),
                              DataColumn(label: Text('fullName')),
                              DataColumn(label: Text('Role')),
                              DataColumn(label: Text('Gender')),
                              DataColumn(label: Text('degree')),
                              DataColumn(label: Text('birthday')),

                              DataColumn(label: Text('Edit')),
                              DataColumn(label: Text('Delete')),
                            //  DataColumn(label: Text('Status')),
                              DataColumn(label: Text('Details')),
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
  RegisteryController controller = Get.find();
//  LevelController controller1 = Get.find();

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
     DataCell(Text(
              '${controller.Classes.values.elementAt(index).fullName}')),
          DataCell(Text(
              '${controller.Classes.values.elementAt(index).role}')),
          DataCell(Text(
            '${controller.Classes.values.elementAt(index).gender}')),
          DataCell(Text(
            '${controller.Classes.values.elementAt(index).degree}')),
          DataCell(Text(
     '${controller.Classes.values.elementAt(index).birthday}')),
      DataCell(IconButton(
          onPressed: () {
             Get.toNamed(RegisteryEdit.routeName,arguments: [controller.Classes.keys.elementAt(index)]);
            },
          icon: const Icon(
            Icons.edit,
            color: AppColors.card1,
          ))),
      DataCell(IconButton(
          onPressed: () {
            print(controller.Classes.values.elementAt(index).id!);
           //  controller.DeleteEmp(controller.registeryes.values.elementAt(index).id!);
             Get.defaultDialog(
                 title: "Do you want to Delete it ?",
                 middleText:"",
              buttonColor: Colors.red,
                    confirmTextColor: Colors.white,
                    cancelTextColor: Colors.red,
                    textConfirm: 'yes',
                    textCancel: 'no',
                    onConfirm: () {
                      print('ddddddddddddddddddddd');
                      controller.Delete(controller.Classes.values.elementAt(index).id!);
                      Get.back();
                    }, onCancel: (){
               Get.back();
             }
            );
          },
          icon: const Icon(
            Icons.delete,
            color: AppColors.card1,
          ))),
      DataCell(IconButton(
          onPressed: () {
            Dialogs.Info(" Rigestery Info ",RegisterydialogDetail(id:index));
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
  int get rowCount => controller.Classes.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
