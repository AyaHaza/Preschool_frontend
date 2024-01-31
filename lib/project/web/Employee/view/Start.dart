// // import 'package:flutter/material.dart';
// // import '../widgets/AppBarMobil.dart';
// // import '../widgets/NavBarWeb.dart';
// // import '../../../CONSTANT/responsive.dart';
// // import '../widgets/appBarWeb.dart';
// // class StartPage extends StatelessWidget {
// //   const StartPage({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       //appBarMobile()
// //       appBar: !Responsive.isDesktop(context) ?  const appBarWeb() :  appBarMobile() as PreferredSizeWidget,
// //       body: !Responsive.isDesktop(context) ? const NavBarWeb() : const NavBarWeb(),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../CONSTANT/responsive.dart';
// import '../Controller/AppBar/AppBarController.dart';
// import '../widgets/AppBarMobil.dart';
// import '../widgets/DrawerWidget.dart';
// import '../widgets/NavBarWeb.dart';
//
// import '../widgets/appBarWeb.dart';
// class StartPage extends StatelessWidget {
//   static const routeName = '/';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //appBarMobile()
//       appBar:appBarMobile() as PreferredSizeWidget,
//       body: APPDrawer(),
//     //  body: Responsive.isDesktop(context)  ?  APPDrawer() :  NavBarWeb(),
//     );
//   }
// }
