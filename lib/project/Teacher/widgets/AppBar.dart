import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/project/Teacher/view/CategoryMangement/AllCategory/AllCategory.dart';
import 'package:project/project/Teacher/view/ExamsMangement/AllSubjects/AllSubjects.dart';
import 'package:project/project/Teacher/view/HomeworkMangement/AllSubjects/AllSub.dart';
import 'package:project/project/Teacher/view/LessonsMangement/AllSubject/AllSubjectL.dart';

import '../Controller/Authentication/AuthController.dart';
import '../Controller/School/SchoolController.dart';
import '../view/FileManagement/ViewPage.dart';
import '../view/Profile/ProfilePage.dart';

import '../view/Teacher_view/Advertisement/home_screen.dart';
import '../view/Teacher_view/Attendance/FetchForm.dart';
import '../view/Teacher_view/Attendance/checkform.dart';
import '../Service/Authentication/AuthNetwork.dart';
class AppDrawer extends StatelessWidget {
  final inputController = InputController();
  AuthController auth = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 290.w,
      child: Drawer(
        // child: GetBuilder<ProfileController> (
        //   //   init: ProfileController(),
        //   builder: (controller) =>
        child: ListView(children: [
          GetBuilder<AuthController>(
              builder: (controller) => Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      SizedBox(
                        width: 60.w,
                        height: 60.w,
                        child: CircleAvatar(
                          minRadius: 23.w,
                          backgroundImage: controller.user!.photo != null
                              ? Image.network('${AuthNetwork.base}/' +'${controller.user!.photo!}').image
                              : ExactAssetImage("images/profile.jpg")
                          as ImageProvider,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),controller.user?.name!=null?Text(
        controller.user!.name!,
        style: TextStyle(  fontSize: 19.sp),
      ):Text(''),


                    ],
                  ))),
         SizedBox(height: 5.h,),
         Divider(height: 3.h,thickness: 2,),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Get.offAllNamed("/"),
          ),
          ListTile(
            leading: Icon(Icons.person_pin),
            title: Text('Profile'),
            onTap: () => Get.offAllNamed(ProrfilePage.routeName),
          ),

          ListTile(
            leading: Icon(Icons.person),
            title: Text('Attendance Information'),
            onTap: () => Get.offAllNamed(AttendanceView.routeName),
          ),


          ListTile(
            leading: Icon(Icons.check_box),
            title: Text('Attendance Check'),
            onTap: () => Get.offAllNamed(Attendancecheckform.routeName),
          ),

          ListTile(
            onTap: () {
              Get.offAllNamed(AllCategory.routeName);
            },
            title: Text(
              'Quize',
            ),
            //  subtitle: Text('Location 1',style: TextStyle(color: Colors.black,fontSize: 20),),
            leading: Icon(
              Icons.border_color,

            ),
          ),
          ListTile(
            onTap: () {
              Get.offAllNamed(AllSubjects.routeName);
            },
            title: Text(
              'Exams',
            ),
            //  subtitle: Text('Location 1',style: TextStyle(color: Colors.black,fontSize: 20),),
            leading: Icon(
              Icons.book, ),
          ),
          ListTile(
            onTap: () {
              Get.offAllNamed(AllSubjectsL.routeName);
            },
            title: Text(
              'Lessons',
            ),
            //  subtitle: Text('Location 1',style: TextStyle(color: Colors.black,fontSize: 20),),
            leading: Icon(
              Icons.menu_book_sharp,
            ),
          ),
          ListTile(
            onTap: () {
              Get.offAllNamed(AllSubjectsLH.routeName);
            },
            title: Text(
              'Homeworks',
            ),
            //  subtitle: Text('Location 1',style: TextStyle(color: Colors.black,fontSize: 20),),
            leading: Icon(
              Icons.home_work_rounded,
            ),
          ),
          ListTile(
            onTap: () {
              Get.offAllNamed(FileManagemet.routeName);
            },
            title: Text(
              'Files',
            ),
            //  subtitle: Text('Location 1',style: TextStyle(color: Colors.black,fontSize: 20),),
            leading: Icon(
              Icons.file_copy,
            ),
          ),
          // if(controller.userData!.role=='admin')
          //   ListTile(
          //     leading: Icon(Icons.group),
          //     title: Text('ALL Groups'),
          //     onTap:  ()=>Get.offAllNamed(APPGroup.routeName),
          //   ),
          //
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              auth.logout();
            },
          ),
          Container(
              alignment: Alignment.center,
              // margin: EdgeInsets.symmetric(vertical: 200.h),
              child: GetBuilder<SchoolController>(
                builder: (controller1) => Text(
                  "  School : ${controller1.school!.name} \n  phone : ${controller1.school!.phone}",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                ),
              ))
        ]),
      ),
    );
  }
}
