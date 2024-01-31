// import 'package:flutter/material.dart';
// import '../../../CONSTANT/colors.dart';
// import 'StyleText.dart';
// import 'appBarActionItems.dart';
//
// class appBarMobile extends StatelessWidget with PreferredSizeWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: const StyleText(
//         text: 'Name School',
//       ),
//       backgroundColor: AppColors.blue,
//       actions: [
//         IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.search_rounded,
//               color: Colors.grey,
//             )),
//         AppBarActionItems(),
//       ],
//     );
//   }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Controller/School/SchoolController.dart';
import 'Header2.dart';
import 'StyleText.dart';
import 'appBarActionItems.dart';

class appBarMobile extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(30.h),
      child: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false, // hides leading widget
        title: GetBuilder<SchoolController>(
    builder: (controller1) =>  StyleText(
          text: controller1.school!.name,
        ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Header2(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
