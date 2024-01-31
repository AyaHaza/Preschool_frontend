import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/CONSTANT/size_config.dart';
import '../widgets/AppBarMobil.dart';
import '../widgets/DrawerWidget.dart';
import '../widgets/header.dart';
import 'Home/HomeContent.dart';


// import 'package:flutter/material.dart';
// import '../widgets/AppBarMobil.dart';
// import '../widgets/NavBarWeb.dart';
// import '../../../CONSTANT/responsive.dart';
// import '../widgets/appBarWeb.dart';
// class StartPage extends StatelessWidget {
//   const StartPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //appBarMobile()
//       appBar: !Responsive.isDesktop(context) ?  const appBarWeb() :  appBarMobile() as PreferredSizeWidget,
//       body: !Responsive.isDesktop(context) ? const NavBarWeb() : const NavBarWeb(),
//     );
//   }
// }



class Template extends StatelessWidget {
  String text;
  Widget Content;
  Template({required this.text,required this.Content});


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar:appBarMobile() as PreferredSizeWidget,
      backgroundColor: Colors.grey.withOpacity(0.1),
      //  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        body: APPDrawer( Content: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(text: text,),
              SizedBox(height: 36.h,),
              Divider(thickness: 2, color: Colors.white,),
              Expanded(
                  child: Container(
                    color: Colors.white,
                    height: 700.h,
                    width: 800.w,
                    child: Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Padding(padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                            child: Content)
                    ),
                  ))
            ],
          ),
        ),
        )
    );
  }
}
