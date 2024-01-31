import 'Model.dart';

class StudentClasses extends Model {
  String? name;
  bool?isSlect=false;





  StudentClasses({
    this.name,
    this.isSlect,
    id,
  }):super(id: id);


  factory StudentClasses.fromJson(Map<String, dynamic> json) => StudentClasses(
    name: json["name"].toString(),
    id: json["id"],

  );

  Map<String, dynamic> toJson() => {
    //"id": id,
    "name":name,
    "id": id,

  };
}
