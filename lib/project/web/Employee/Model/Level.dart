import 'Model.dart';

class Level extends Model{
  String? name;
  int? age;

  Level({
     this.name,
     this.age,
     id,
  }):super(id: id);



  factory Level.fromJson(Map<String, dynamic> json) => Level(
    name: json["name"],
    age: json["age"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "id": id,
  };
}