import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/firebase_options.dart';

import 'Bindings/ConfigBinding.dart';
import 'Bindings/FeeConfig.dart';
import 'Bindings/RegestryBinding.dart';
import 'Bindings/ReportBinding.dart';
import 'Bindings/SchoolBinding.dart';
import 'Bindings/StudentBinding.dart';
import 'Controller/School/SchoolController.dart';
import 'Model/Report.dart';

import 'Controller/Authentication/AuthController.dart';
import 'Middleware/AuthMiddleware.dart';
import 'view/Authentication/login.dart';

import 'view/Configs/ConfigAdd.dart';
import 'view/Configs/ConfigEdit.dart';
import 'view/Configs/ConfigPage.dart';
import 'view/Configs/FeeConfig/ADD/FeeConfigAdd.dart';
import 'view/Configs/FeeConfig/Edit/ConfigEdit.dart';
import 'view/Configs/FeeConfig/Show/FeeShow.dart';
import 'view/Home/HomePage.dart';
import 'view/Profile/ProfileEdit.dart';
import 'view/RegistryMangement/RegisteryAll/RegisteryAll.dart';
import 'view/Report/ViewPage.dart';
import 'view/StudentMangement/StudentAll/StudentAll.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     Get.put(AuthController(), permanent: true);
     Get.put<SchoolController>(SchoolController(), permanent: true);

     return ScreenUtilInit(
        designSize: const Size(1000, 1000),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'PRE_SCHOOL_PROJECT',
              initialRoute:HomePage.routeName ,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                primaryColor: Colors.cyan,
                accentColor: Colors.amber,
              ),
              getPages: [
                GetPage(
                  name: HomePage.routeName,
                  page: () => HomePage(),
                  arguments: [0],
                  middlewares: [AuthMiddleware()],

                ),
                GetPage(
                  name: Login.routeName,
                  page: () => Login(),
                ),

                GetPage(
                  name:ProfileEditPage.routeName,
                  page: () => ProfileEditPage(),
                  middlewares: [AuthMiddleware()],

                ),


                GetPage(
                    name: ReportView.routeName,
                    page: () => ReportView(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    binding: ReportBinding()
                ),
                GetPage(
                  name: ConfigAdd.routeName,
                  page: () => ConfigAdd(),
                  middlewares: [
                    AuthMiddleware(),
                  ],
                  binding: ConfigBinding(),
                ),
                GetPage(
                    name: ConfigEdit.routeName,
                    page: () => ConfigEdit(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    binding: ConfigBinding()
                ),
                GetPage(
                    name: ConfigManagemet.routeName,
                    page: () => ConfigManagemet(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    binding: ConfigBinding()
                ),   GetPage(
                    name: FeeConfigAdd.routeName,
                    page: () => FeeConfigAdd(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    bindings:[FeeConfigBinding()]
                ),

                GetPage(
                    name: YearFeeConfigShow.routeName,
                    page: () => YearFeeConfigShow(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    bindings:[FeeConfigBinding()]
                ),
                GetPage(
                    name: YearConfigEdit.routeName,
                    page: () => YearConfigEdit(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    bindings:[FeeConfigBinding()]
                ),
                GetPage(
                    name: RegisteryManagemet.routeName,
                    page: () => RegisteryManagemet(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    binding: RegisteryBinding()
                ),

                GetPage(
                    name: StudentManagemet.routeName,
                    page: () => StudentManagemet(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    binding: StudentBinding()
                ),

              ],
          );
        });
  }
}
//   home: FutureBuilder(
//     future: controller,
// builder: (ctx, authResultSnapshot) =>
// authResultSnapshot.connectionState ==
// ConnectionState.waiting
// ? SplashScreen()
// : controller.isAuth ?  HomePage() : Login(),
// ),