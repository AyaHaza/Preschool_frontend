import 'dart:async';
import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import '../../Model/Location.dart'as loc;
import '../../Controller/Authentication/AuthController.dart';
import '../../Controller/BUS_Trucking/Map_Controller.dart';
import '../../Controller/School/SchoolController.dart';
import '../../Functions/Route.dart';
import '../../widgets/AppBar.dart';


class StudentMapScreen extends StatefulWidget {
  static const String route = '/student/Map';

  @override
  State<StudentMapScreen> createState() => _StudentMapScreenState();
}

class _StudentMapScreenState extends State<StudentMapScreen> {
  final database = FirebaseDatabase.instance.reference();
  AuthController authController = Get.find();

  CameraPosition? _initialCameraPosition;
  CameraPosition? BusLocation;

  var location = new Location();

  MapboxMapController? controller;

  Map<String ,CameraPosition>_kRestaurantsList ={};

  Map? modifiedResponse={};
double? distance;
String? duration;
  LatLng? latLng ;

  SchoolController Schoolcontroller = Get.find();

  Map_Controller  Mapcontroller = Get.find();
  DatabaseReference? locationdb ;
  StreamSubscription<DatabaseEvent>? stream1;
  StreamSubscription<DatabaseEvent>? stream2;

  @override
  void initState() {
    super.initState();
    initializeLocationAndSave();
  }
  @override
  void dispose() {
    if(stream1!=null)
   stream1!.cancel();
    if(stream2!=null)
      stream2!.cancel();
    super.dispose();
  }
  _onMapCreated(MapboxMapController controller) async {
    this.controller = controller;
    //
    // var markerImage = await loadMarkerImage();
    // controller.addImage('marker', markerImage);
    //
    // var schoolImage = await SchoolloadMarkerImage();
    // controller.addImage('schoolmarker', schoolImage);
    //
    // var BusImage = await BusloadMarkerImage();
    // controller.addImage('Busmarker', BusImage);

    //
    // locationdb=  database.child('/Location');
    // final snapshot = await locationdb!.child("/lat").get();
    // double lat= double.parse(snapshot.value.toString());
    // final snapshot1 = await locationdb!.child("/lng").get();
    // double lng= double.parse(snapshot1.value.toString());
    // print("ggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg");
    // print("$lat : $lng");
    // BusLocation=CameraPosition(target: LatLng(lat ,lng ),zoom: 15);
    //
    //
    // await controller.addSymbol(
    //   SymbolOptions(
    //     textField:"School" ,
    //     geometry: _initialCameraPosition!.target,
    //     iconSize: 0.2,
    //     iconImage: "schoolmarker",
    //   ),
    // );
    //
    // Symbol bus= await controller.addSymbol(
    //   SymbolOptions(
    //     textField:"" ,
    //     geometry: BusLocation!.target,
    //     iconSize: 0.2,
    //     iconImage: "Busmarker",
    //   ),
    // );
    // _kRestaurantsList.forEach((key, value) async {
    //   await controller.addSymbol(
    //     SymbolOptions(
    //       textField:key ,
    //       geometry: value.target,
    //       iconSize: 0.2,
    //       iconImage: "marker",
    //     ),
    //   );
    // });
    //
    // stream1=  locationdb!.child("/lng")!.onValue.listen((DatabaseEvent event) {
    //   final data = event.snapshot.value;
    //   print("______________________________________________________________________________________");
    //   if(data!=null) {
    //     print(data);
    //     LatLng newloc = LatLng(
    //         bus.options.geometry!.latitude, double.parse(data.toString()));
    //       controller.updateSymbol(bus, SymbolOptions(
    //         textField: "BUS",
    //         geometry: newloc,
    //         iconSize: 0.2,
    //         iconImage: "Busmarker",
    //       ));
    //
    //   }
    // });
    // stream2= locationdb!.child("/lat")!.onValue.listen((DatabaseEvent event) {
    //   final data = event.snapshot.value;
    //   print("______________________________________________________________________________________");
    //   if(data!=null) {
    //     print("$data  :     ${bus.options.geometry!.longitude}");
    //     LatLng newloc = LatLng(
    //         double.parse(data.toString()), bus.options.geometry!.longitude);
    //       controller.updateSymbol(bus, SymbolOptions(
    //         textField: "BUS",
    //         geometry: newloc,
    //         iconSize: 0.2,
    //         iconImage: "Busmarker",
    //       ));
    //   }
    // });


    // for (CameraPosition _kRestaurant in _kRestaurantsList) {
    //   await controller!.addSymbol(
    //     SymbolOptions(
    //       textField: ,
    //       geometry: _kRestaurant.target,
    //       iconSize: 0.4,
    //       iconImage: "marker",
    //     ),
    //   );
    // }
  }

  void initializeLocationAndSave() async {

    latLng  = LatLng(Schoolcontroller.school!.location!.lat!,Schoolcontroller.school!.location!.lng!);
    _initialCameraPosition = CameraPosition(target: latLng!, zoom: 15);

    Mapcontroller.Students.forEach((element) {
      _kRestaurantsList.addAll({ element.name : CameraPosition(target: LatLng(element.lat, element.lng), zoom: 15)});
    });
    locationdb=  database.child('/Location');
    final snapshot = await locationdb!.child("/lat").get();
    double lat= double.parse(snapshot.value.toString());
    final snapshot1 = await locationdb!.child("/lng").get();
    double lng= double.parse(snapshot1.value.toString());
    print("ggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg");
    print("$lat : $lng");
    BusLocation=CameraPosition(target: LatLng(lat ,lng ),zoom: 15);


    // Future.delayed(Duration(seconds: 10));
  }

  _addSourceAndLineLayer(int index, bool removeLayer) async {
    // Can animate camera to focus on the item
    // controller!.animateCamera(
    //     CameraUpdate.newCameraPosition(_kRestaurantsList[index]));

     var markerImage = await loadMarkerImage();
    controller!.addImage('marker', markerImage);

    var schoolImage = await SchoolloadMarkerImage();
    controller!.addImage('schoolmarker', schoolImage);

    var BusImage = await BusloadMarkerImage();
    controller!.addImage('Busmarker', BusImage);

    List<loc.Location> locations =[];
    Mapcontroller.Students.forEach((element) {
      _kRestaurantsList.addAll({ element.name : CameraPosition(target: LatLng(element.lat, element.lng), zoom: 15)});
    });

    Mapcontroller.Students.forEach((element) {
      print (element.lng);
      locations.add(loc.Location(lat:element.lat ,lng: element.lng));
    });
    modifiedResponse = await getDirectionsAPIResponse(locations);
    // await getDistance();

    Map geometry = modifiedResponse!['geometry'];
    final _fills = {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "id": 0,
          "properties": <String, dynamic>{},
          "geometry": geometry,
        },
      ],
    };

    // Remove lineLayer and source if it exists
    if (removeLayer == true) {
      await controller!.removeLayer("lines");
      await controller!.removeSource("fills");

    }

    // Add new source and lineLayer
    await controller!.addSource("fills", GeojsonSourceProperties(data: _fills));
    await controller!.addLineLayer(
      "fills",
      "lines",
      LineLayerProperties(
        lineColor: Colors.blue.toHexStringRGB(),
        lineCap: "round",
        lineJoin: "round",
        lineWidth: 4,
      ),
    );
  }

  //


  Future<Uint8List> loadMarkerImage() async {
    var byteData = await rootBundle.load("images/House.png");
    return byteData.buffer.asUint8List();
  }

  Future<Uint8List> SchoolloadMarkerImage() async {
    var byteData = await rootBundle.load("images/school.png");
    return byteData.buffer.asUint8List();
  }
  Future<Uint8List> BusloadMarkerImage() async {
    var byteData = await rootBundle.load("images/bus.png");
    return byteData.buffer.asUint8List();
  }

  _onStyleLoadedCallback() async {
    locationdb=  database.child('/Location');
    final snapshot = await locationdb!.child("/lat").get();
    double lat= double.parse(snapshot.value.toString());
    final snapshot1 = await locationdb!.child("/lng").get();
    double lng= double.parse(snapshot1.value.toString());
    print("ggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg");
    print("$lat : $lng");
    BusLocation=CameraPosition(target: LatLng(lat ,lng ),zoom: 15);


    await controller!.addSymbol(
      SymbolOptions(
        textField:"School" ,
        geometry: _initialCameraPosition!.target,
        iconSize: 0.3,
        iconImage: "schoolmarker",
      ),
    );

    _kRestaurantsList.forEach((key, value) async {
      await controller!.addSymbol(
        SymbolOptions(
          textField:key ,
          geometry: value.target,
          iconSize: 0.2,
          iconImage: "marker",
        ),
      );
    });
    Symbol bus= await controller!.addSymbol(
      SymbolOptions(
        textField:"" ,
        geometry: BusLocation!.target,
        iconSize: 0.2,
        iconImage: "Busmarker",
      ),
    );



    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    _addSourceAndLineLayer(0, false);





    stream1=  locationdb!.child("/lng")!.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print("______________________________________________________________________________________");
      if(data!=null) {
        print(data);
        LatLng newloc = LatLng(
            bus.options.geometry!.latitude, double.parse(data.toString()));
        controller!.updateSymbol(bus, SymbolOptions(
          textField: "BUS",
          geometry: newloc,
          iconSize: 0.2,
          iconImage: "Busmarker",
        ));

      }
    });
    stream2= locationdb!.child("/lat")!.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print("______________________________________________________________________________________");
      if(data!=null) {
        print("$data  :     ${bus.options.geometry!.longitude}");
        LatLng newloc = LatLng(
            double.parse(data.toString()), bus.options.geometry!.longitude);
        controller!.updateSymbol(bus, SymbolOptions(
          textField: "BUS",
          geometry: newloc,
          iconSize: 0.2,
          iconImage: "Busmarker",
        ));
      }
    });




  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 19),
        title:Text("Bus Map") ,
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Stack(
          children: [

            SizedBox(

              child: MapboxMap(
                trackCameraPosition: true,
                accessToken: "xxxxxxxxx",//Map_Controller.MapboxAccessToken,
                initialCameraPosition: _initialCameraPosition!,
                onMapCreated: _onMapCreated,
                onStyleLoadedCallback: _onStyleLoadedCallback,

                // onUserLocationUpdated:(userlocation) async {
                //   await    locationdb!.update({'lat' : userlocation.position.latitude ,'lng' : userlocation.position.longitude}).then((value) => print("witten")).catchError((error) => print("444"+error)).onError((error, stackTrace) => print(error));
                //   // locationdb.set({'lat' : userlocation.position.latitude ,'lng' : userlocation.position.longitude}).then((value) => print("witten")).catchError((error) => print("444"+error));
                //
                // } ,
                minMaxZoomPreference: const MinMaxZoomPreference(10, 20),

                // minMaxZoomPrefer0ence: const MinMaxZoomPreference(14, 17),
              ),
            ),
            FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  controller!.animateCamera(
                      CameraUpdate.newCameraPosition(_initialCameraPosition!));
                },
                // child: const Icon(Icons.my_location),

            ),


          ],
        ),
      ),
    );
  }
}
