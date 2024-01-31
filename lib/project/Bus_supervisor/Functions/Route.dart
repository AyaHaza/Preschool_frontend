import 'package:mapbox_gl/mapbox_gl.dart';

import '../Service/BUS/RouteDirection.dart';
import '../Model/Location.dart'as loc;


Future<Map> getDirectionsAPIResponse(List<loc.Location> locations) async {
  final response = await getCyclingRouteUsingMapbox(locations);
  print(response);
  Map geometry = response['routes'][0]['geometry'];
  num duration = response['routes'][0]['duration'];
  num distance = response['routes'][0]['distance'];

  Map modifiedResponse = {
    "geometry": geometry,
    "duration": duration,
    "distance": distance,
  };
  print("mmooooodiifiiiedddddddddddddddddddddddddddddddd");
  print(modifiedResponse);
  return modifiedResponse;
}
