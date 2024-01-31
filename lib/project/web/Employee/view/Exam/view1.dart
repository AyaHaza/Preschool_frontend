import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/colors.dart';

import '../../Controller/Exams/FileExamController.dart';
import '../../Model/Exam.dart';
import '../../Controller/Levels/LevelController.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';

class content extends StatelessWidget {

  // @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Row(
          children: [
            Expanded(
                child: GetBuilder<FileExamController>(
                  builder: (controller) =>  PaginatedDataTable(
                    columns: const [

                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('status')),
                      DataColumn(label: Text('term')),
                      DataColumn(label: Text('type') ),
                      DataColumn(label: Text('publishDate') ),
                      DataColumn(label: Text('subjectName')),
                      DataColumn(label: Text('teacherName') ),
                      DataColumn(label: Text('className') ),
                      DataColumn(label: Text('') ,numeric: true),
                      DataColumn(label: Text('Open')),

                    ],
                    showFirstLastButtons: true,
                    arrowHeadColor: Colors.cyanAccent,
                    source:  MyData(),
                    // horizontalMargin: 10,
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
  FileExamController controller = Get.find();

  @override
  DataRow? getRow(int index) {
    Exam exam =controller.Files.values.elementAt(index);
    return DataRow(cells: [
      DataCell(Text(exam.name!)),
      DataCell(Text(exam.status!)),
      DataCell(Text(exam.term!)),
      DataCell(Text(exam.type!)),
      DataCell(Text(exam.publishDate!)),
      DataCell(Text(exam.subjectName!)),
      DataCell(Text(exam.teacherName!)),
      DataCell(Text(exam.className!)),
      DataCell(SizedBox(
        width: 10,
      )),

      DataCell(IconButton(
          onPressed: ()=>controller.open(index),
          icon: const Icon(
            Icons.open_in_browser,
            color: AppColors.black,
          ))),

    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => controller.Files.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
