// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import '../../Controller/Exams/FileExamController.dart';
// import '../../widgets/EditPage/InputDecoration.dart';
// import '../../widgets/EditPage/TextField.dart';
// import '../../widgets/Dialogs/ErrorDialog.dart';
// import '../../Model/File.dart';
// class content extends StatefulWidget {
//   @override
//   State<content> createState() => _contentState();
// }
//
// class _contentState extends State<content> {
//   FileExamController controller = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           SizedBox(
//             height: 10.h,
//           ),
//           Container(
//             width: 900.w,
//             child: FutureBuilder(
//       future: controller.Fetch(),
//       builder: (ctx, authResultSnapshot) =>
//       authResultSnapshot.connectionState ==
//       ConnectionState.waiting
//       ? const Center(child: CircularProgressIndicator())
//           : GetBuilder<FileExamController>(
//         builder: (controller2) => ListView.builder(
//             shrinkWrap: true,
//             itemCount: controller2.Files.length,
//             itemBuilder: (BuildContext context, int position) {
//               return SizedBox(
//                 height: 100.h,
//                 child: Card(
//                   elevation: 2,
//                   margin: EdgeInsets.all(3.w),
//                   child: ListTile(
//                     onTap: (){
//                       controller.open(position);
//                     },
//                     hoverColor:Colors.black.withOpacity(0.1),
//                     leading: Icon(
//                       Icons.picture_as_pdf_sharp,
//                       size: 30,
//                       color: Color.fromRGBO(185, 10, 10, 1.0),
//                     ),
//                     title: Padding(
//                       padding:  EdgeInsets.only(top: 12.h),
//                       child: Text(controller2.Files.values.elementAt(position)!.name!,style: TextStyle(fontWeight: FontWeight.bold),),
//                     ),
//
//                   ),
//
//                 ),
//               );
//             }),
//           )
//       ),
//           ),
//         ],
//       ),
//     );
//   }
// }
