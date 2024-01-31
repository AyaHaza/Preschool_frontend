



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';
import 'package:get/get.dart';
import '../../Controller/BUS_Trucking/Start_UP_screen_controller.dart';
import '../../Functions/GetLocation.dart';
import '../../widgets/blodText.dart';
import '../Advertisement/home_screen.dart';
import '../../Controller/Authentication/AuthController.dart';
import '../../Model/Location.dart' as loc;
class Start_Up_Location extends StatelessWidget {
  static const routeName = '/Startup/Location';
  LocationData? _locationData;
  AuthController controller =Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200.h,
          width: 300.w,
          child:
    //       FutureBuilder(
    //     future:   controller.Fetch(),
    // builder: (ctx, authResultSnapshot) =>
    // authResultSnapshot.connectionState ==
    // ConnectionState.waiting
    // ?Center(child: CircularProgressIndicator()):
    //
    GetBuilder<Startup_screenController>(
        builder: (controller) =>Column(
            children: [
              TextBlod(text: "Location Setup ",size:40.sp),
              SizedBox(height: 20.h,),
              Expanded(child:  Text(
                " إجراء ضروري لتحديد موقعك الذي سيتم اعتماده لتوصيل الطالب إلى هذا المكان ضمن باص الروضة .لا تقلق يمكنك تغييره لاحقا",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold,),
                textDirection: TextDirection.rtl,
              ),
                ),
              if (controller.isLoading)
                CircularProgressIndicator()
              else
              ElevatedButton.icon(onPressed: () async {
                _locationData = await initializeLocationAndSave();
               print (_locationData);
               if(_locationData!=null)
                 {
                   controller.Edit(loc.Location(id:1,lat:_locationData!.latitude,lng:_locationData!.longitude));
                   Get.toNamed('/');
                 }
              }, icon:Icon( Icons.add_location_alt), label: Text("Get My Location"),),
              SizedBox(height: 10.h,),
              Text(controller.msg),
            ],
          ),
        ),
        )
      ),
    );
  }
}