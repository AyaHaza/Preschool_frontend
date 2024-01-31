import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:http_proxy/http_proxy.dart';
import '../../firebase_options.dart';
import 'Bindings/MapBinding.dart';
import 'Bindings/SchoolBinding.dart';
import 'Controller/Authentication/AuthController.dart';
import 'Controller/Authentication/services.dart';
import 'Middleware/AuthMiddleware.dart';
import 'view/Authentication/login1.dart';
import 'view/Authentication/login.dart';
import 'view/BUS_Trucking/Map.dart';
import 'view/Profile/ProfilePage.dart';
import 'view/Home.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  await initialServices();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
Get.put(AuthController());
    return ScreenUtilInit(
        designSize: const Size(400, 500),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            key: GlobalKey(),
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                elevation: 1,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 19),
                backgroundColor: Colors.white,
              ),
              primarySwatch: Colors.blue,
              primaryColor: Colors.black,
              //accentColor: Colors.amber,
            ),
            debugShowCheckedModeBanner: false,
            title: 'PRE_SCHOOL_PROJECT',

            initialRoute:  Login1.routeName,

            getPages: [
              // GetPage(
              //     name: SplashScreen.routeName,
              //     page: () =>  SplashScreen(),
              //     middlewares: [AuthMiddleware()]
              // ),
              GetPage(
                  name:'/Home',
                  page: () =>Home(),
                  //middlewares: [AuthMiddleware()],
                  bindings:[MapBinding(),SchoolBinding()]
              ),
              GetPage(
                  name:'/',
                  page: () =>MapScreen(),
                  //middlewares: [AuthMiddleware()],
                  bindings:[MapBinding(),SchoolBinding()]
              ),

              GetPage(name: Login.routeName, page: () => Login(),),
              GetPage(name: Login1.routeName, page: () => Login1(),),
              GetPage(
                name: ProrfilePage.routeName,
                page: () =>  ProrfilePage(),
                //middlewares: [AuthMiddleware()],
              ),

            ],
          );
        }
    );
  }
}

