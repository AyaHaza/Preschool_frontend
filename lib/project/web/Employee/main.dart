import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/firebase_options.dart';
import 'Bindings/CountBinding.dart';
import 'Bindings/Attendance.dart';
import 'Bindings/BusBinding.dart';
import 'Bindings/ExamFile.dart';
import 'Bindings/Fille.dart';
import 'Bindings/LateNotify.dart';
import 'Bindings/RegestryBinding.dart';
import 'Bindings/SettingsBinding.dart';
import 'Bindings/StudentBinding.dart';
import 'Bindings/TeacherMangementBinding.dart';
import 'Bindings/studentFee.dart';
import 'Controller/School/SchoolController.dart';
import 'view/Advertisement/Advetisement.dart';
import 'view/Attendance/ALLStudents.dart';
import 'view/Attendance/FetchForm.dart';
import 'view/BusMangement/BusAdd/BusAdd.dart';
import 'view/BusMangement/BusAll/BusAll.dart';
import 'view/BusMangement/BusEdit/BusEdit.dart';
import 'view/Classes/ClassEdit.dart';
import 'Bindings/ClassBinding.dart';
import 'Bindings/LevelBinding.dart';
import 'Bindings/SubjectBinding.dart';
import 'Controller/Authentication/AuthController.dart';
import 'Middleware/AuthMiddleware.dart';
import 'view/Authentication/login.dart';
import 'view/Classes/ClassPage.dart';
import 'view/Classes/classAdd.dart';
import 'view/Exam/ViewPage.dart';
import 'view/FileManagement/ViewPage.dart';
import 'view/Home/HomePage.dart';
import 'view/Levels/LevelAdd.dart';
import 'view/Levels/LevelEdit.dart';
import 'view/Levels/LevelPage.dart';
import 'view/Profile/ProfileEdit.dart';
import 'view/RegistryMangement/RegisteryAll/RegisteryAll.dart';
import 'view/RegistryMangement/RegisteryEdit/RegisteryEdit.dart';
import 'view/RegistryMangement/RegistryAdd/RegistruAdd.dart';
import 'view/Settings/Settings.dart';
import 'view/StudentMangement/StudentAdd/StudentAdd.dart';
import 'view/StudentMangement/StudentAll/StudentAll.dart';
import 'view/StudentMangement/StudentEdit/StudentEdit.dart';
import 'view/StudentsFees/ADD/FeesADD.dart';
import 'view/StudentsFees/Show/ShowFee.dart';
import 'view/StudentsFees/studentFee/fetch.dart';
import 'view/StudentsFees/studentFee/view.dart';
import 'view/Subject/SubjectAdd.dart';
import 'view/Subject/SubjectEdit.dart';
import 'view/Subject/SubjectPage.dart';
import 'view/BusMangement/BusStudents/BusStudentsall.dart';
import 'view/TeacherMangement/AllTeacher.dart';
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
                // accentColor: Colors.amber,
              ),
              getPages: [
                GetPage(
                  name: HomePage.routeName,
                  page: () => HomePage(),
                  arguments: [0],
                    middlewares: [AuthMiddleware()],
                   bindings:[LateNotifyBinding(),

                   ]
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
                  name: LevelAdd.routeName,
                  page: () => LevelAdd(),
                  middlewares: [AuthMiddleware()],
                  binding:LevelBinding()
                ),

                GetPage(
                  name: LevelManagemet.routeName,
                  page: () => LevelManagemet(),
                  middlewares: [
                    AuthMiddleware(),
                  ],
                    binding:LevelBinding()
                ),
                GetPage(
                    name: LevelEdit.routeName,
                    page: () => LevelEdit(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                ),
                GetPage(
                  name: ClassEdit.routeName,
                  page: () => ClassEdit(),
                  middlewares: [
                    AuthMiddleware(),
                  ],
                ),
                GetPage(
                  name: SubjectAdd.routeName,
                  page: () => SubjectAdd(),
                  middlewares: [
                    AuthMiddleware(),
                  ],
                  bindings:[SubjectBinding(),LevelBinding(),]
                ),
                GetPage(
                  name: SubjectEdit.routeName,
                  page: () => SubjectEdit(),
                    bindings:[SubjectBinding(),LevelBinding(),],

                    middlewares: [
                    AuthMiddleware(),
                  ],
                ),
                GetPage(
                    name: SubjectManagemet.routeName,
                    page: () => SubjectManagemet(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    bindings:[SubjectBinding(),LevelBinding(), ClassBinding()]
                ),
                GetPage(
                    name: ClassAdd.routeName,
                    page: () => ClassAdd(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    bindings:[
                      LevelBinding(),
                      ClassBinding()
                    ]
                ),
                GetPage(
                    name: ClassManagemet.routeName,
                    page: () => ClassManagemet(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    bindings:[
                      LevelBinding(),
                      ClassBinding()
                    ]
                ),

                GetPage(
                    name: Settings.routeName,
                    page: () => Settings(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    binding: SettingsBinding()
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




                GetPage(
                  name: StudentAdd.routeName,
                  page: () => StudentAdd(),
                  middlewares: [
                    AuthMiddleware(),
                  ],
                  bindings: [StudentBinding(),BusBinding()]
                ),
                GetPage(
                    name: StudentEdit.routeName,
                    page: () => StudentEdit(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    bindings: [StudentBinding(),BusBinding()]
                ),
                GetPage(
                    name: StudentManagemet.routeName,
                    page: () => StudentManagemet(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    bindings: [StudentBinding(),BusBinding()]
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
                  name: BusAdd.routeName,
                  page: () => BusAdd(),
                  middlewares: [
                    AuthMiddleware(),
                  ],
                  binding: BusBinding(),
                ),
                GetPage(
                    name: BusEdit.routeName,
                    page: () => BusEdit(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    bindings:[ BusBinding(),StudentBinding()]
                ),
                GetPage(
                    name: BusManagemet.routeName,
                    page: () => BusManagemet(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    bindings:[ BusBinding(),StudentBinding()]
                ),
                GetPage(
                    name: BusStudents.routeName,
                    page: () => BusStudents(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                ),
                GetPage(
                  name: AttendanceView.routeName,
                  page: () => AttendanceView(),
                  middlewares: [
                    AuthMiddleware(),
                  ],
                    bindings:[ ClassBinding(),AttendanceBinding()]
                ),
                GetPage(
                    name: ALLStudents.routeName,
                    page: () => ALLStudents(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    bindings:[AttendanceBinding()]
                ),
                GetPage(
                    name: TeacherManagemet.routeName,
                    page: () => TeacherManagemet(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    bindings:[
                      TeacherMangementtBinding(),
                    ]
                ),





                GetPage(
                    name: FeeAdd.routeName,
                    page: () => FeeAdd(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    bindings:[FeeBinding(),StudentBinding()]
                ),
                GetPage(
                    name: FeeStudentview.routeName,
                    page: () => FeeStudentview(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    bindings:[FeeBinding(),StudentBinding()]
                ),
                GetPage(
                    name: Feefetch.routeName,
                    page: () => Feefetch(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    bindings:[FeeBinding(),StudentBinding()]
                ),

                GetPage(
                    name: FeeConfigShow.routeName,
                    page: () => FeeConfigShow(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    bindings:[FeeBinding()]
                ),
                GetPage(
                    name: FileManagemet.routeName,
                    page: () => FileManagemet(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    bindings:[FileBinding()]
                ),
                GetPage(
                    name: ExamsView.routeName,
                    page: () => ExamsView(),
                    middlewares: [
                      AuthMiddleware(),
                    ],
                    bindings:[ExamFileBinding()]
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