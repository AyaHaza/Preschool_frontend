import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../CONSTANT/colors.dart';
import '../../Controller/Attendance/Attendance.dart';
import '../../Controller/Attendance/formScreen.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import '../../widgets/EditPage/InputDecoration.dart';
import '../../widgets/EditPage/TextField.dart';
import '../Template.dart';
import '../../Model/AbsentStudent.dart';
class ALLStudents extends StatelessWidget {
  static const routeName = '/Absence';


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Template(
        text: "Absence Information",
        Content: SingleChildScrollView(
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: GetBuilder<AttendanceController>(
                builder: (controller) => PaginatedDataTable(
                    columns: const [
                      DataColumn(label: Text('fullName')),
                      DataColumn(label: Text('date')),
                      DataColumn(label: Text('phone'), numeric: true),
                      DataColumn(label: Text('justification')),
                      DataColumn(label: Text('')),
                      DataColumn(label: Text('Delete')),
                    ],
                    showFirstLastButtons: true,
                    arrowHeadColor: Colors.cyanAccent,
                    source: MyData(),
                    columnSpacing: 10,
                    horizontalMargin: 20,
                    headingRowHeight: 80,
                  ),
                )
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
  TextEditingController dateCtl = TextEditingController();
  AttendanceControllerScreen controllerScreen = Get.find();
  final formKey = GlobalKey<FormState>();

  @override
  DataRow? getRow(int index) {
    AbsentStudent student= controller.AbsentStudents.elementAt(index);
    DateTime date=student.date!;
   dateCtl.text=student.justification ==null ?"not Entered":student.justification!;

    return DataRow(cells: [
      DataCell(Text(student.fullName!)),
      DataCell(Text("${date.month}/${date.day}/${date.year}")),
      DataCell(Text(student.phone.toString())),
      DataCell(Row(
        children: [
          Text(student.justification==null?" ":student.justification!),

    IconButton(
              onPressed: () {
                Get.defaultDialog(
                  titleStyle: TextStyle(fontSize: 20.sp),
                    title: "Edit justification for ${student.fullName}",
                    content:SizedBox(
                      width: 300.w,
                      height: 200.h,
                      child: Form(
                        key: formKey,
                        child :TextField1("",    TextFormField(
                          controller: dateCtl,
                          decoration: decoration(),
                          onSaved: (value) {
                            print("dddddddddddddddddddddddddddddddddddddddddddd");
                            print(dateCtl.text);
                            controllerScreen.EditData=AbsentStudent(id:student.id,date: student.date, justification: dateCtl.text, fullName: student.fullName, phone: student.phone);
                          },
                        ), "")

                      ),
                    ),
                  actions: <Widget>[
                    FloatingActionButton(
                      focusColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0))
                      ),
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      child: Text("No"),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    FloatingActionButton(
                        focusColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0))
                        ),
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        child: Text("Yes"),
                        onPressed: ()
                        {
                          formKey.currentState!.save();
                          controllerScreen.Update();
                          Get.back();
                        }
                    )
                  ],
                );
              },
              icon: const Icon(
                Icons.edit,
                color: AppColors.card2,
              )),
        ],
      )),
      DataCell(SizedBox(
        width: 400,
      )),
      DataCell(IconButton(
          onPressed: () {
            Dialogs.Confirm("Are you sure you want to delete it ?",() async =>  await controller.Delete(student.id!));
          },
          icon: const Icon(
            Icons.delete,
            color: AppColors.card2,
          ))),

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
