import 'Model.dart';

class TeacherClasses extends Model {
  String? name;
   String? capacity;
    String? level_id;
 





  TeacherClasses({
    this.name,
    this.capacity,
    this.level_id,
    id,
  }):super(id: id);


  factory TeacherClasses.fromJson(Map<String, dynamic> json) => TeacherClasses(
    name: json["name"].toString(),
     capacity: json["capacity"].toString(),
      level_id: json["level_id"].toString(),
    id: json["id"],

  );

  Map<String, dynamic> toJson() => {
    //"id": id,
    "name":name,
    "capacity":capacity,
    "level_id":level_id,

    "id": id,

  };
}
