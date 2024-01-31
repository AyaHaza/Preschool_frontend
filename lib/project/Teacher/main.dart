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
import 'package:project/project/Teacher/Bindings/AllCatBiniding.dart';
import 'package:project/project/Teacher/Bindings/AllExams.dart';
import 'package:project/project/Teacher/Bindings/AllHomework.dart';
import 'package:project/project/Teacher/Bindings/AllLessons.dart';
import 'package:project/project/Teacher/Bindings/AllSubjects.dart';
import 'package:project/project/Teacher/Bindings/QSBinding.dart';
import 'package:project/project/Teacher/Bindings/QuestionABinding.dart';
import 'package:project/project/Teacher/view/CategoryMangement/AddCategory/AddCategory.dart';
import 'package:project/project/Teacher/view/CategoryMangement/AllCategory/AllCategory.dart';
import 'package:project/project/Teacher/view/CategoryMangement/EditCategory/EditGategory.dart';
import 'package:project/project/Teacher/view/ExamsMangement/AddExam/AddExam.dart';
import 'package:project/project/Teacher/view/ExamsMangement/AllExams/AllExam/AllExam.dart';
import 'package:project/project/Teacher/view/ExamsMangement/AllSubjects/AllSubjects.dart';
import 'package:project/project/Teacher/view/HomeworkMangement/AddHomework/AddHomework.dart';
import 'package:project/project/Teacher/view/HomeworkMangement/AllHomework/AllHomework.dart';
import 'package:project/project/Teacher/view/HomeworkMangement/AllLessons/AllLesson.dart';
import 'package:project/project/Teacher/view/HomeworkMangement/AllSubjects/AllSub.dart';
import 'package:project/project/Teacher/view/HomeworkMangement/EditHomework/EditHomework.dart';
import 'package:project/project/Teacher/view/LessonsMangement/AddLessons/AddLesson.dart';
import 'package:project/project/Teacher/view/LessonsMangement/AllLessons/AllLesson.dart';
import 'package:project/project/Teacher/view/LessonsMangement/AllSubject/AllSubjectL.dart';
import 'package:project/project/Teacher/view/QuestionMangement/AddQuestion/AddQuestion.dart';
import 'package:project/project/Teacher/view/QuestionMangement/AllQuistion/AllQustion.dart';
import 'package:project/project/Teacher/view/QuestionMangement/EditQuistion/EditQustion.dart';
import '../../firebase_options.dart';
import 'Bindings/Attendance.dart';
import 'Bindings/AttendanceScreen.dart';
import 'Bindings/profileBinding.dart';
import 'Bindings/Fille.dart';
import 'Bindings/TeacherClass.dart';
import 'Controller/Advertisement/Teacher/Classes.dart';
import 'Controller/Attendance/Attendance.dart';
import 'Controller/Authentication/AuthController.dart';
import 'Controller/Authentication/services.dart';
import 'Middleware/AuthMiddleware.dart';
import 'view/Authentication/login1.dart';
import 'view/Authentication/login.dart';
import 'view/FileManagement/ViewPage.dart';
import 'view/Home.dart';
import 'view/LessonsMangement/Classes/AllClass.dart';
import 'view/Profile/ProfilePage.dart';
import 'view/Teacher_view/Advertisement/home_screen.dart';

import 'view/Teacher_view/Attendance/ALLStudents.dart';
import 'view/Teacher_view/Attendance/AllStudentcheck.dart';
import 'view/Teacher_view/Attendance/FetchForm.dart';
import 'view/Teacher_view/Attendance/checkform.dart';
import 'view/splash_screen.dart';
import 'Bindings/SchoolBinding.dart';
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
    //Get.put<AuthController>(AuthController(), permanent: false);
    Get.put<TeacherClassController>(TeacherClassController(), permanent: false);

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

            initialRoute: '/',

            getPages: [
              // GetPage(
              //     name: SplashScreen.routeName,
              //     page: () =>  SplashScreen(),
              //     middlewares: [AuthMiddleware()]
              // ),

              GetPage(
                name: '/',
                page: () =>  HomeScreen(),
                //// middlewares: [AuthMiddleware()],
                  bindings: [ProfileBinding(),SchoolBinding(),TeacherClassBinding()]

          ),

              GetPage(name: Login.routeName, page: () => Login(),),
              GetPage(name: Login1.routeName, page: () => Login1(),),
              GetPage(
                name: ProrfilePage.routeName,
                page: () =>  ProrfilePage(),
                 bindings: [ProfileBinding()]
                 // middlewares: [AuthMiddleware()],
              ),
              GetPage(
                name: AttendanceView.routeName,
                page: () =>  AttendanceView(),
               // middlewares: [AuthMiddleware()],
                bindings: [AttendanceBinding(),AttendanceScreenBinding()]

              ),
              GetPage(
                  name: ALLStudents.routeName,
                  page: () =>  ALLStudents(),
                 // middlewares: [AuthMiddleware()],
                  bindings: [AttendanceBinding(),AttendanceScreenBinding()]
              ),//ALLStudentscheck

              GetPage(
                  name: Attendancecheckform.routeName,
                  page: () =>  Attendancecheckform(),
                 // middlewares: [AuthMiddleware()],
                  bindings: [AttendanceBinding(),]
              ),
              GetPage(
                  name: ALLStudentscheck.routeName,
                  page: () =>  ALLStudentscheck(),
                 // middlewares: [AuthMiddleware()],
                  bindings: [AttendanceScreenBinding()]
              ),
              GetPage(
                  name: AllCategory.routeName,
                  page: () => AllCategory(),
                 // middlewares: [AuthMiddleware()],

                  binding: catBinding()
              ),

              GetPage(
                  name: quizeTeacher.routeName,
                  page: () => quizeTeacher(),
                  binding: QSBinding(),
                 // middlewares: [AuthMiddleware()],


          ),
              GetPage(
                  name: EditQuestionTeacher.routeName,
                  page: () => EditQuestionTeacher(),
                  binding: QSBinding(),
         // middlewares: [AuthMiddleware()],


          ),

              GetPage(
                  name: AddCatContentegory.routeName,
                  page: () => AddCatContentegory(),
                  // middlewares: [AuthMiddleware()],
                  binding: catBinding()
              ),
              GetPage(
                  name: EditCategory.routeName,
                  page: () => EditCategory(),
                  // middlewares: [AuthMiddleware()],
                  binding: catBinding()
              ),
              GetPage(
                  name: AddQiuestion.routeName,
                  page: () => AddQiuestion(),
                  // middlewares: [AuthMiddleware()],
                  binding: QSBinding()
              ),

              GetPage(
                  name: AllSubjects.routeName,
                  page: () => AllSubjects(),
                  // middlewares: [AuthMiddleware()],
                  binding: AllSubBinding()
              ),
              GetPage(
                  name: AllExam.routeName,
                  page: () => AllExam(),
                  // middlewares: [AuthMiddleware()],
                  binding: AllExamBinding()
              ), GetPage(
                  name: AddExam.routeName,
                  page: () => AddExam(),
                  // middlewares: [AuthMiddleware()],
                  binding: AllExamBinding()
              ),
              GetPage(
                  name: AllSubjectsL.routeName,
                  page: () => AllSubjectsL(),
                  binding: AllSubBinding(),
         // middlewares: [AuthMiddleware()],

          ),
              GetPage(
                  name: AllLessons.routeName,
                  page: () => AllLessons(),
                  bindings:[ AllLessonsBinding(),AllHomewokBinding()],
         // middlewares: [AuthMiddleware()],
          ),
              GetPage(
                name: AllClasses.routeName,
                page: () => AllClasses(),
                binding: AllLessonsBinding(),
                // middlewares: [AuthMiddleware()],
              ),


              GetPage(
                  name: LessonAdd.routeName,
                  page: () => LessonAdd(),
                  // middlewares: [AuthMiddleware()],
                  binding: AllLessonsBinding()
              ),
              GetPage(
                  name: AllSubjectsLH.routeName,
                  page: () => AllSubjectsLH(),
                  binding: AllSubBinding(),
         // middlewares: [AuthMiddleware()],

          ),
              GetPage(
                  name: AllLessonsH.routeName,
                  page: () => AllLessonsH(),
                  binding: AllLessonsBinding(),
                 // middlewares: [AuthMiddleware()],

          ),
              GetPage(
                  name: AllHomework.routeName,
                  page: () => AllHomework(),
                  binding: AllHomewokBinding(),
         // middlewares: [AuthMiddleware()],

          ),
              GetPage(
                  name: HomeworkAdd.routeName,
                  page: () => HomeworkAdd(),
                  binding: AllHomewokBinding(),
         // middlewares: [AuthMiddleware()],

          ),
              GetPage(
                  name: EditHomework.routeName,
                  page: () => EditHomework(),
                  binding: AllHomewokBinding(),
         // middlewares: [AuthMiddleware()],

          ),
              GetPage(
                  name: FileManagemet.routeName,
                  page: () => FileManagemet(),
                  bindings:[FileBinding()]

              ),

            ],
          );
        }
    );
}
}

