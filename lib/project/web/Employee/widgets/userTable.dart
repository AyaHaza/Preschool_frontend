// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../CONSTANT/colors.dart';
//
// class table extends StatelessWidget {
//   AllEmployeController controller = Get.find();
//   final DataTableSource _data = MyData();
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const SizedBox(
//           width: 300,
//         ),
//         Expanded(
//           child: PaginatedDataTable(
//             columns: const [
//               //   DataColumn(label: Text('id')),
//               DataColumn(label: Text('fullName')),
//               DataColumn(label: Text('Gender')),
//               DataColumn(label: Text('degree')),
//               DataColumn(label: Text('birthday')),
//               DataColumn(label: Text(''), numeric: true),
//               DataColumn(label: Text('Edit')),
//               DataColumn(label: Text('Delete')),
//               DataColumn(label: Text('Status')),
//               DataColumn(label: Text('Show Details')),
//             ],
//             source: _data,
//             columnSpacing: 50,
//             horizontalMargin: 60,
//             headingRowHeight: 80,
//           ),
//         )
//       ],
//     );
//   }
// }
//
// class MyData extends DataTableSource {
//   final AllEmployeController controller = Get.find();
//
//   @override
//   DataRow? getRow(int index) {
//     return DataRow(cells: [
//       //  DataCell(Text('${controller.controller.Employes!.values.elementAt(index)!.id}')),
//       DataCell(Text(
//           '${controller.controller.Employes!.values.elementAt(index)!.fullName}')),
//       DataCell(Text(
//           '${controller.controller.Employes!.values.elementAt(index)!.gender}')),
//       DataCell(Text(
//           '${controller.controller.Employes!.values.elementAt(index)!.degree}')),
//       DataCell(Text(
//           '${controller.controller.Employes!.values.elementAt(index)!.bb}')),
//
//       DataCell(SizedBox(
//         width: 400,
//       )),
//
//       DataCell(IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             Icons.edit,
//             color: AppColors.card1,
//           ))),
//       DataCell(IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             Icons.delete,
//             color: AppColors.card2,
//           ))),
//       DataCell(IconButton(onPressed: () {}, icon: Icon(Icons.circle))),
//       DataCell(IconButton(
//           onPressed: () {},
//           icon: Icon(
//             Icons.arrow_circle_right_outlined,
//             color: AppColors.iconGray,
//           ))),
//     ]);
//   }
//
//   @override
//   // TODO: implement isRowCountApproximate
//   bool get isRowCountApproximate => false;
//
//   @override
//   // TODO: implement rowCount
//   int get rowCount => controller.controller.Employes!.length;
//
//   @override
//   // TODO: implement selectedRowCount
//   int get selectedRowCount => 0;
// }
