import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/firebase_options.dart';
import 'Bindings/RegestryBinding.dart';
import 'Bindings/SchoolBinding.dart';
import 'Bindings/UsersBinding.dart';
import 'Controller/School/SchoolController.dart';
import 'view/Advertisement/Advetisement.dart';

import 'Controller/Authentication/AuthController.dart';
import 'Middleware/AuthMiddleware.dart';
import 'view/Authentication/login.dart';

import 'view/Home/HomePage.dart';
import 'view/Profile/ProfileEdit.dart';
import 'view/RegistryMangement/RegisteryEdit/RegisteryEdit.dart';
import 'view/RegistryMangement/RegistryAdd/RegistruAdd.dart';
import 'view/School/SchoolEdit.dart';
import 'view/RegistryMangement/RegisteryAll/RegisteryAll.dart';
import 'view/UserManagement/UserEdit/UserEdit.dart';
import 'view/UserManagement/UserManagementPage.dart';
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
                    name: SchoolEdit.routeName,
                    page: () => SchoolEdit(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    binding: SchoolBinding()
                ),

                // GetPage(
                //     name: UserManagement.routeName,
                //     page: () => UserManagement(),
                //     middlewares: [AuthMiddleware()],
                //     binding: UsersBinding()
                // ),
                //
                //

                GetPage(
                    name: UserEdit.routeName,
                    page: () => UserEdit(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    binding: UsersBinding()
                ),
                GetPage(
                    name: UserManagement.routeName,
                    page: () => UserManagement(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    binding: UsersBinding()
                ),


                GetPage(
                  name: RegisteryAdd.routeName,
                  page: () => RegisteryAdd(),
                  middlewares: [
                    AuthMiddleware(),
                  ],
                  binding: RegisteryBinding(),
                ),
                GetPage(
                    name: RegisteryEdit.routeName,
                    page: () => RegisteryEdit(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    binding: RegisteryBinding()
                ),
                GetPage(
                    name: RegisteryManagemet.routeName,
                    page: () => RegisteryManagemet(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    binding: RegisteryBinding()
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