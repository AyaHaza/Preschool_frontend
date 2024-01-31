

import 'Model.dart';

class Student extends Model {

  String name;
  double lng;
  double lat;

  Student({
    id,
    required this.name,
    required this.lng,
    required this.lat,
  }):super(id: id);



  factory Student.fromJson(Map<String, dynamic> json) => Student(
    name: json["name"],
    lng: json["lng"]==null ? 0:json["lng"].toDouble(),
    lat: json["lat"]==null ?0 :json["lat"].toDouble(),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "lng": lng,
    "lat": lat,
    "id":id,
  };
}
