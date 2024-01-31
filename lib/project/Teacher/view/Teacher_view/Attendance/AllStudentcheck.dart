import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Advertisement/Teacher/Classes.dart';
import '../../../Controller/Attendance/formScreen.dart';
import '../../../Model/Student.dart';
import '../../Template.dart';

// class ALLStudentscheck extends StatefulWidget {
//   static const routeName = '/Absence-check';
//
//   @override
//   State<ALLStudentscheck> createState() => _ALLStudentscheckState();
// }
//
// class _ALLStudentscheckState extends State<ALLStudentscheck> {
//   TeacherClassController controller1=Get.find();
//   AttendanceControllerScreen controllerScreen=Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     List<Student>? Students=controller1.teacher_classes_students[Get.arguments[0]];
//     controllerScreen.initiate();
//     return Template(
//         title: "Absence Information",
//         body: SingleChildScrollView(
//           child:GetBuilder<AttendanceControllerScreen>(
//         builder: (controller) =>  Center(
//             child: Row(
//               children: [
//                 SizedBox(
//                   height: 400.h,
//                   width: 400.w,
//                   child:  GetBuilder<TeacherClassController>(
//                     builder: (controller) =>  PaginatedDataTable(
//                       showCheckboxColumn: true,
//
//                     columns: const [
//                       DataColumn(label: Text('fullName')),
//                       DataColumn(label: Text('')),
//                       DataColumn(label: Text('Absent')),
//                     ],
//                     showFirstLastButtons: true,
//                     arrowHeadColor: Colors.cyanAccent,
//                     source: MyData(class_id:Get.arguments[0],Students: Students),
//                     columnSpacing: 10,
//                     horizontalMargin: 0,
//                     headingRowHeight: 80,
//                   ),)
//                 )
//
//               ],
//             ),
//           ),
//           )
//         )
//     );
//   }
// }
// class MyData extends DataTableSource {
//   int class_id;
//   List<Student>? Students;
//   MyData({required this.class_id,required this.Students});
//   AttendanceControllerScreen controller=Get.find();
//
//   @override
//   DataRow? getRow(int index) {
//     return DataRow.byIndex(
//         index: index,cells: [
//       DataCell(Text('${Students!.elementAt(index).name}')),
//       DataCell(SizedBox(width: 20.w,)),
//       DataCell(
//    Checkbox(
//         value: controller.absents[class_id]!.elementAt(index),
//         onChanged: (bool? value) {
//           print(value);
//           controller.absents[class_id]!.elementAt(index)!=value;
//           controller.update();
//         },
//       )),
//     ]);
//   }
//
//   @override
//   // TODO: implement isRowCountApproximate
//   bool get isRowCountApproximate => false;
//
//   @override
//   // TODO: implement rowCount
//   int get rowCount =>  Students!.length;
//
//   @override
//   // TODO: implement selectedRowCount
//   int get selectedRowCount => 0;
// }

class ALLStudentscheck extends StatefulWidget {
  static const routeName = '/Absence-check';
  var class_id = Get.arguments[0];

  @override
  State<ALLStudentscheck> createState() => _ALLStudentscheckState();
}

class _ALLStudentscheckState extends State<ALLStudentscheck> {
  TeacherClassController controller1 = Get.find();

  @override
  Widget build(BuildContext context) {
    List<Student>? Students =
        controller1.teacher_classes_students[widget.class_id];

    return Template(
        title: "Absence Information ",
        body: GetBuilder<AttendanceControllerScreen>(
              builder: (controller) => Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Text(
                                "Information for ${controller1.Teacherclass[widget.class_id]!.name} "),
                            IconButton(
                                color: Colors.green,
                                onPressed: () {
                                  controller.AbsentPost(widget.class_id);
                                },
                                icon: Icon(Icons.done_outline_outlined)),
                            Text("Save"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: Students!.length,
                          itemBuilder: (_, index) => CheckboxListTile(
                              title: Text(Students[index].name),
                              secondary: const Icon(Icons.person),
                              activeColor: Colors.red,
                              selected:
                              controller.init1absents![widget.class_id]!.elementAt(index)!,
                              value: controller.init1absents![widget.class_id]!.elementAt(index),
                              onChanged: (bool? value) {
                                setState(() {
                                  controller.init1absents![widget.class_id]![index] =
                                      value;
                                  print(value);
                                });
                              }),
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 0);
                          },
                        ),
                      ),
                    ],
                  )))
    );
  }
}
// CheckboxListTile(
// title: const Text('Sample Label'),
// value: false,
// onChanged: () {},
// ),
