import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../../Controller/BUSTracking/Location_screen_controller.dart';
import '../../Controller/Bus/Vrp.dart';
import '../../Functions/GetLocation.dart';
import '../../Model/Location.dart' as loc;
import '../../widgets/Dialogs/ErrorDialog.dart';

class VRP extends StatelessWidget {
  static const routeName = '/StudentBus/Distribution';
  VRPController controller =Get.find();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
     child: Column(
          children: [
            Text("ReAssign Students on Buses"),
            SizedBox(
              height: 10.h,
            ),
              ElevatedButton.icon(
                onPressed: () async {
                 controller.Assign();
                },
                icon: Icon(Icons.assignment_turned_in_outlined),
                label: Text("ReAssign"),
              ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),

    );
  }
}
