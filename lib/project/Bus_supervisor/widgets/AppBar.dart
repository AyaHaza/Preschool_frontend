import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Service/Authentication/AuthNetwork.dart';
import '../Controller/Authentication/AuthController.dart';
import '../Controller/School/SchoolController.dart';
import '../view/Profile/ProfilePage.dart';
import '../view/BUS_Trucking/Map.dart';
class AppDrawer extends StatelessWidget {
  final inputController = InputController();

  @override
  Widget build(BuildContext context) {
    AuthController auth =Get.put(AuthController(), permanent: false);
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
                      ),
                      controller.user?.name!=null?Text(
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
            onTap: () => Get.offAllNamed('/Home'),
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Bus Map'),
            onTap: () => Get.offAllNamed('/'),
          ),
          ListTile(
            leading: Icon(Icons.person_pin),
            title: Text('Profile'),
            onTap: () => Get.offAllNamed(ProrfilePage.routeName),
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
          SizedBox(height:230.h),
          Container(
              alignment: Alignment.bottomLeft,
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
