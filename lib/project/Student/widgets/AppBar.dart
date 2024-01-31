import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/project/Student/view/CategoryMangement/AllCategory/AllCategory.dart';
import '../Controller/Authentication/AuthController.dart';
import '../Controller/School/SchoolController.dart';
import '../view/BUS_Trucking/BusInfo.dart';
import '../view/BUS_Trucking/Map.dart';
import '../view/Profile/ProfilePage.dart';
import '../view/Settings/Settings.dart';
import '../view/cc.dart';
import '../Service/Authentication/AuthNetwork.dart';

class AppDrawer extends StatelessWidget {
  final inputController = InputController();

  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find();
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
                              ? Image.network("${AuthNetwork.base}/" +'${controller.user!.photo!}').image
                              : const ExactAssetImage("images/profile.jpg")
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
            onTap: () => Get.offAllNamed("/"),
          ),
          ListTile(
            leading: Icon(Icons.person_pin),
            title: Text('Profile'),
            onTap: () => Get.offAllNamed(ProrfilePage.routeName),
          ),
if(auth.user!.bus_id!=null)
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => screenLock(
                context: context,
                correctString: "1234",
                onUnlocked: () => Get.offAllNamed(Settings.routeName)),
          ),
          if(auth.user!.bus_id!=null)
          ListTile(
            leading: Icon(Icons.map_outlined),
            title: Text('BUS Map'),
            onTap: () => Get.offAllNamed(StudentMapScreen.route),
          ),
          if(auth.user!.bus_id!=null)
          ListTile(
            leading: Icon(Icons.info),
            title: Text('BUS Information'),
            onTap: () => Get.offAllNamed(BusInfo.routeName),
          ),
          ListTile(
            leading: Icon(Icons.map_outlined),
            title: Text('Coloring'),
            onTap: () => Get.offAllNamed(Colore.routeName),
          ),
          // if(controller.userData!.role=='admin')
          //   ListTile(
          //     leading: Icon(Icons.group),
          //     title: Text('ALL Groups'),
          //     onTap:  ()=>Get.offAllNamed(APPGroup.routeName),
          //   ),
          //

          ListTile(
            onTap: (){
              Get.offAllNamed(AllCategory.routeName);
            },
            title: Text('Quize',),
            //  subtitle: Text('Location 1',style: TextStyle(color: Colors.black,fontSize: 20),),
            leading: Icon( Icons.border_color),
          ),

          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              auth.logout();
            },
          ),
SizedBox(height: 100.h,),
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
