import 'Model.dart';
class SubjectClass extends Model{
  int? subjectId;
  String? subjectName;
  String? name;
  int? capacity;
  int? levelId;

  SubjectClass({
     this.subjectId,
     this.subjectName,
     id,
     this.name,
     this.capacity,
     this.levelId,
  }):super(id: id);

  factory SubjectClass.fromJson(Map<String, dynamic> json) => SubjectClass(
    subjectId: json["subject_id"],
    subjectName: json["subject_name"],
    id: json["id"],
    name: json["name"],
    capacity: json["capacity"],
    levelId: json["level_id"],
  );

  Map<String, dynamic> toJson() => {
    "subject_id": subjectId,
    "subject_name": subjectName,
    "id": id,
    "name": name,
    "capacity": capacity,
    "level_id": levelId,
  };
}
