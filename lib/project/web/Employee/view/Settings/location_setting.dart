import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../../Controller/BUSTracking/Location_screen_controller.dart';
import '../../Functions/GetLocation.dart';
import '../../Model/Location.dart' as loc;
import '../../widgets/Dialogs/ErrorDialog.dart';

class Edit_Location extends StatelessWidget {
  static const routeName = '/Location/Edit';
  LocationData? _locationData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<Location_screenController>(
        builder: (controller) => Column(
          children: [
            Text("Location Edit Take my new loaction "),
            SizedBox(
              height: 10.h,
            ),
            if (controller.isLoading)
              CircularProgressIndicator()
            else
              ElevatedButton.icon(
                onPressed: () async {
                  _locationData = await initializeLocationAndSave();
                  print(_locationData);
                  if (_locationData != null) {
                    controller.Edit(loc.Location(
                        id: 1,
                        lat: _locationData!.latitude,
                        lng: _locationData!.longitude));
                  }
                },
                icon: Icon(Icons.add_location_alt),
                label: Text("Get My Location"),
              ),
            SizedBox(
              height: 10.h,
            ),
            Text(controller.msg),
          ],
        ),
      ),
    );
  }
}
