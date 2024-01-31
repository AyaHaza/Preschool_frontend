



import 'Model.dart';

class Subject extends Model {
  String? name;
  int?level_id;

  Subject({
    this.name,
    this.level_id,
    id,
  }):super(id: id);



  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    name: json["name"],
    level_id: json["level_id"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "level_id":level_id,
    "id": id,
  };
}
