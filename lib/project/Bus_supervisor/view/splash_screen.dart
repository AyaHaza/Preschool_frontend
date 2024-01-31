// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'Home.dart';
//
// import '../Controller/Authentication/AuthController.dart';
//
// class SplashScreen extends StatelessWidget {
//   static const routeName = '/Splash';
//
//   @override
//   Widget build(BuildContext context) {
//
//     AuthController controller =Get.find();
//
//     return Scaffold(
//       body:controller.isAuth
//           ? Home()
//           : FutureBuilder(
//         future: controller.tryAutoLogin(),
//         builder: (ctx, authResultSnapshot) =>
//         authResultSnapshot.connectionState ==
//             ConnectionState.waiting
//             ? SplashScreen()
//             : AuthScreen(),
//       ),
//
//
//
//       Center(
//         child: CircularProgressIndicator(
//           backgroundColor: Theme.of(context).primaryColor,
//         )
//       ),
//     );
//   }
// }
