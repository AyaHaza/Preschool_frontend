import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/colors.dart';

import '../../../Controller/Users/UsersController.dart';
import '../../../widgets/Dialogs/ErrorDialog.dart';
import '../UserEdit/UserEdit.dart';





class userpagecontent extends StatelessWidget {


  // @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Row(
          children: [
            Expanded(
                child: GetBuilder<UsersController>(
                  builder: (controller) =>  PaginatedDataTable(
                    columns: const [
                      //   DataColumn(label: Text('id')),
                      DataColumn(label: Text('fullName')),
                      DataColumn(label: Text('role')),
                      DataColumn(label: Text('Status')),


                      DataColumn(label: Text('Edit')),
                      DataColumn(label: Text('Delete')),
                      //  DataColumn(label: Text('Status')),

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
  UsersController controller = Get.find();
//  LevelController controller1 = Get.find();

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(
          '${controller.users.values.elementAt(index).name}')),
      DataCell(Text(
          '${controller.users.values.elementAt(index).role}')),
      DataCell(Text(
          '${controller.users.values.elementAt(index).status}')),

      DataCell(IconButton(
          onPressed: () {
            Get.toNamed(UserEdit.routeName,arguments: [controller.users.keys.elementAt(index)]);
          },
          icon: const Icon(
            Icons.edit,
            color: AppColors.card1,
          ))),
      DataCell(IconButton(
          onPressed: () {
            print(controller.users.values.elementAt(index).id!);
            //  controller.DeleteEmp(controller.users.values.elementAt(index).id!);
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
                controller.Delete(controller.users.values.elementAt(index).id!);
                Get.back();
              },
                onCancel: (){
                  Get.back();
                }
            );
          },
          icon: const Icon(
            Icons.delete,
            color: AppColors.delete,
          ))),

    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => controller.users.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
