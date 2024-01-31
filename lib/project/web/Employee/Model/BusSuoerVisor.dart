import 'Model.dart';

class BusVisor extends Model {
  String? name;




  BusVisor({
    this.name,
    id,
  }):super(id: id);


  factory BusVisor.fromJson(Map<String, dynamic> json) => BusVisor(
    name: json["name"].toString(),
    id: json["id"],

  );

  Map<String, dynamic> toJson() => {
    //"id": id,
    "name":name,
    "id": id,

  };
}
