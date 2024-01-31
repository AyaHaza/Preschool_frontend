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
import 'Bindings/AllCatBiniding.dart';
import 'Bindings/MapBinding.dart';
import 'Bindings/QSBinding.dart';
import 'Bindings/Start_up_location.dart';
import 'Controller/Authentication/AuthController.dart';
import 'Controller/Authentication/services.dart';
import 'Middleware/AuthMiddleware.dart';
import 'view/Authentication/login1.dart';
import 'view/Authentication/login.dart';
import 'view/BUS_Trucking/BusInfo.dart';
import 'view/BUS_Trucking/Map.dart';
import 'view/BUS_Trucking/START_UP_LOCATION.dart';
import 'view/CategoryMangement/AllCategory/AllCategory.dart';
import 'view/Profile/ProfilePage.dart';
import 'view/Advertisement/home_screen.dart';
import 'view/Quizes/Quiz.dart';
import 'view/Quizes/quiz_screen.dart';
import 'view/cc.dart';
import 'view/splash_screen.dart';
import 'Bindings/SchoolBinding.dart';
import 'view/Settings/Settings.dart';
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
   Get.put(AuthController(), permanent: true);

    return ScreenUtilInit(
        designSize: const Size(400, 500),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
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

            initialRoute:  '/',

            getPages: [
              // GetPage(
              //     name: SplashScreen.routeName,
              //     page: () =>  SplashScreen(),
              //     middlewares: [AuthMiddleware()]
              // ),

              GetPage(
                name: '/',
                page: () =>  HomeScreen(),
                // middlewares: [AuthMiddleware()],
                bindings: [SchoolBinding(),MapBinding(),]
          ),
              GetPage(
                  name: BusInfo.routeName,
                  page: () =>  BusInfo(),
                // middlewares: [AuthMiddleware()],
                  bindings: [MapBinding(),SchoolBinding()]
                 // bindings: [MapBinding()]

              ),
              GetPage(
                  name:Start_Up_Location.routeName,
                  page: () =>Start_Up_Location(),
                  // middlewares: [AuthMiddleware()],
                  binding:Startup_LocationBinding()
              ),
              GetPage(
                  name:Settings.routeName,
                  page: () =>Settings(),
                // middlewares: [AuthMiddleware()],
                  binding:Startup_LocationBinding()
              ),
              GetPage(
                  name:StudentMapScreen.route,
                  page: () =>StudentMapScreen(),
                // middlewares: [AuthMiddleware()],
                  binding:MapBinding()
              ),
              GetPage(name: Login.routeName, page: () => Login(),),
              GetPage(name: Login1.routeName, page: () => Login1(),),
              GetPage(
                name: ProrfilePage.routeName,
                page: () =>  ProrfilePage(),
                // middlewares: [AuthMiddleware()],
              ),
              GetPage(
                  name: QuizApp.routeName,
                  page: () => QuizApp(),
                  binding: QSBinding(),
                // middlewares: [AuthMiddleware()],

              ),
              GetPage(
                  name: QuizScreen.routeName,
                  page: () => QuizScreen(),
                  binding: QSBinding(),
                // middlewares: [AuthMiddleware()],

          ),

              GetPage(
                  name: AllCategory.routeName,
                  page: () => AllCategory(),
                // middlewares: [AuthMiddleware()],

                  binding: catBinding()
              ),
              GetPage(
                name: Colore.routeName,
                page: () => Colore(),

                // middlewares: [AuthMiddleware()],

              ),
            ],
          );
        }
    );
}
}

