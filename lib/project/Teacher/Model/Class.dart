import 'Model.dart';

class Class extends Model {
  String? name;
  int? capacity;
  int? levelId;


  Class({
     this.name,
     this.capacity,
     this.levelId,
     id,
  }):super(id: id);

  @override
  factory Class.fromJson(Map<String, dynamic> json) => Class(
    name: json["name"],
    capacity: json["capacity"],
    levelId: json["level_id"],
    id: json["id"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "name": name,
    "capacity": capacity,
    "level_id": levelId,
    "id": id,
  };
}