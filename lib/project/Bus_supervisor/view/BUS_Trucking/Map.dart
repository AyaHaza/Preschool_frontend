import 'dart:typed_data';

import '../../widgets/AppBar.dart';

import '../../Functions/Route.dart';

import '../../Model/Location.dart'as loc;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import '../../Controller/BUS_Trucking/Map_Controller.dart';
import '../../Controller/School/SchoolController.dart';
class MapScreen extends StatefulWidget {

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


  final database = FirebaseDatabase.instance.reference();

  CameraPosition? _initialCameraPosition;
  var location = new Location();
  MapboxMapController? controller;
  Map<String ,CameraPosition>_kRestaurantsList ={};
  Map? modifiedResponse={};
  LatLng? latLng ;
  SchoolController Schoolcontroller = Get.find();
  Map_Controller  Mapcontroller = Get.find();

  @override
  void initState() {
    super.initState();
    initializeLocationAndSave();
    Future.delayed(Duration(seconds: 20));
  }

  _onMapCreated(MapboxMapController controller) async {
    this.controller = controller;

    // await controller!.addSymbol(
    //   SymbolOptions(
    //     textField:"School" ,
    //     geometry: _initialCameraPosition!.target,
    //     iconSize: 0.2,
    //     iconImage: "schoolmarker",
    //   ),
    // );
    // _kRestaurantsList.forEach((key, value) async {
    //   await controller!.addSymbol(
    //   SymbolOptions(
    //   textField:key ,
    //   geometry: value.target,
    //   iconSize: 0.4,
    //   iconImage: "marker",
    //   ),
    //   );
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
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    // Future.delayed(Duration(seconds: 10));
  }

  _addSourceAndLineLayer(int index, bool removeLayer) async {
    var markerImage = await loadMarkerImage();

    controller!.addImage('marker', markerImage);
    var schoolImage = await SchoolloadMarkerImage();

    controller!.addImage('schoolmarker', schoolImage);
    // Can animate camera to focus on the item
    // controller!.animateCamera(
    //     CameraUpdate.newCameraPosition(_kRestaurantsList[index]));
    List<loc.Location> locations =[];
    Mapcontroller.Students.forEach((element) {
      _kRestaurantsList.addAll({ element.name : CameraPosition(target: LatLng(element.lat, element.lng), zoom: 15)});
    });

    Mapcontroller.Students.forEach((element) {
      print (element.lng);
      locations.add(loc.Location(lat:element.lat ,lng: element.lng));
    });

    modifiedResponse = await getDirectionsAPIResponse(locations);


    // // Calculate the distance and time from data in SharedPreferences
    // for (int index = 0; index <  Mapcontroller.Students.length; index++) {
    //   num distance = modifiedResponse / 1000;
    //   num duration = getDurationFromSharedPrefs(index) / 60;
    //   carouselData
    //       .add({'index': index, 'distance': distance, 'duration': duration});
    // }
    // carouselData.sort((a, b) => a['duration'] < b['duration'] ? 0 : 1);
    //
    // // Generate the list of carousel widgets
    // carouselItems = List<Widget>.generate(
    //     restaurants.length,
    //         (index) => carouselCard(carouselData[index]['index'],
    //         carouselData[index]['distance'], carouselData[index]['duration']));
    //

    // Add a polyLine between source and destination
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
  _onStyleLoadedCallback() async {

    _kRestaurantsList.forEach((key, value) async {
      await controller!.addSymbol(
        SymbolOptions(
          textField:key ,
          geometry: value.target,
            iconSize: 0.4,
          iconImage: "marker",
        ),
      );
    });
    await controller!.addSymbol(
      SymbolOptions(
        textField:"School" ,
        geometry: _initialCameraPosition!.target,
        iconSize: 0.2,
        iconImage: "schoolmarker",
      ),
    );
    _addSourceAndLineLayer(0, false);
  }

  @override
  Widget build(BuildContext context) {
    final locationdb =database.child('/Location');
    print("dddddddddddddddddddddddddddddddddddd");
print(locationdb.key);
    return  Scaffold(
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
                height: 700,
                child: MapboxMap(
                  trackCameraPosition :true,
                  accessToken: "sk.eyJ1IjoiZ2hhZGVlcjU5NTkiLCJhIjoiY2xqNnZramsyMHBmajNubnhiMm9uc285MCJ9.yj-ft_7bvAlmtcCAVPtbgA",//"pk.eyJ1IjoiZ2hhZGVlcjU5NTkiLCJhIjoiY2xnNDdnYzZqMGNsODNucWVsYzBzeGVrdiJ9.7gLWQmAcj-sD06_SUAl_lQ",//Map_Controller.MapboxAccessToken,
                  initialCameraPosition: _initialCameraPosition!,
                  onMapCreated: _onMapCreated,
                  onStyleLoadedCallback: _onStyleLoadedCallback,
                  myLocationEnabled: true,
                  myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
                  onUserLocationUpdated:(userlocation) async {
                await    locationdb.update({'lat' : userlocation.position.latitude ,'lng' : userlocation.position.longitude}).then((value) => print("witten")).catchError((error) => print("444"+error)).onError((error, stackTrace) => print(error));
                    // locationdb.set({'lat' : userlocation.position.latitude ,'lng' : userlocation.position.longitude}).then((value) => print("witten")).catchError((error) => print("444"+error));

                  } ,
                  minMaxZoomPreference: const MinMaxZoomPreference(10, 20),

                  // minMaxZoomPrefer0ence: const MinMaxZoomPreference(14, 17),
                ),
              ),
              FloatingActionButton(
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