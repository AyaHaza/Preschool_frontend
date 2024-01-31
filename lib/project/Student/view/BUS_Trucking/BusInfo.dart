import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Controller/Authentication/AuthController.dart';
import '../../Controller/BUS_Trucking/Map_Controller.dart';
import '../../Controller/School/SchoolController.dart';
import '../../Functions/Route.dart';
import '../../Model/Student.dart';

import '../../Model/Location.dart' as loc;
import '../Template.dart';

class BusInfo extends StatelessWidget {
  static const routeName = '/BusInfo';
  Map_Controller  Mapcontroller = Get.find();
  SchoolController Schoolcontroller = Get.find();
  AuthController authController = Get.find();
  double? distance;
  String? duration;
  Future<void> getDistance()async {
    Map? busResponse={};

    Student student= Mapcontroller.Students.where((element) => element.id==authController.user!.id).first;
    print("Student *****************************************************************************");
    print(student.name);
    busResponse = await getDirectionsAPIResponse(
        [loc.Location(lat:Schoolcontroller.school!.location!.lat! ,lng: Schoolcontroller.school!.location!.lng),
          loc.Location(lat:student.lat ,lng: student.lng)]
    );
    print("______________________________________________________________");
    print(Schoolcontroller.school!.BusTime.minute);
    print(busResponse["duration"]/60);
    DateTime t= Schoolcontroller.school!.BusTime.add(Duration(minutes:(busResponse["duration"]/60 as double).toInt() ));
    distance=busResponse["distance"];
    print(distance);
    duration="${t.hour}: ${t.minute}";
    print("ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
    print("((((((((((((((((object))))))))))))))))");
    print(distance);
    print(duration);
  }

  @override
  Widget build(BuildContext context) {
    return Template(
        title: "Bus Information",
        body:   FutureBuilder(
        future:  getDistance(),
        builder: (ctx, authResultSnapshot) =>
        authResultSnapshot.connectionState == ConnectionState.waiting
            ?  Center(
            child: CircularProgressIndicator(
              backgroundColor: Theme
                  .of(context)
                  .primaryColor,
            ))
            :  Padding(
              padding:  EdgeInsets.all(20.w),
              child: Container(
              height: 60.h,
              width: 300.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("BUS TIME : $duration min",style: TextStyle(  fontSize: 18.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                  Text("Distance : $distance m",style: TextStyle( decoration: TextDecoration.none,fontWeight: FontWeight.bold,fontSize: 18.sp,color: Colors.black)),
                ],
              ),
        ),
            ),
      )
    );
  }
}