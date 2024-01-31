import 'Model.dart';

class Bus extends Model {
  String? capacity;
  String? number;
  String? bus_supervisor_id;




  Bus({
     this.capacity,
     this.number,
     this.bus_supervisor_id,
      id,
  }):super(id: id);


  factory Bus.fromJson(Map<String, dynamic> json) => Bus(
    capacity: json["capacity"].toString(),
    number: json["number"].toString(),
    bus_supervisor_id: json["bus_supervisor_id"].toString(),
         id: json["id"],

  );

  Map<String, dynamic> toJson() => {
    //"id": id,
    "capacity":capacity,
    "number":number,
    "bus_supervisor_id":bus_supervisor_id,
    "id": id,

  };
}
