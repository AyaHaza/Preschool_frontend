
import 'Model.dart';

class Exam extends Model {
  String? name;
  String? filePath;
  String? status;
  String? term;
  String? type;
  String? publishDate;
  String? subjectName;
  String? teacherName;
  String? className;

  Exam({
     this.name,
     this.filePath,
     this.status,
     this.term,
     this.type,
     this.publishDate,
     this.subjectName,
     this.teacherName,
     this.className,
    id
  }):super(id: id);

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
    id: json["id"],
    name: json["name"],
    filePath: json["file_path"],
    status: json["status"],
    term: json["term"],
    type: json["type"],
    publishDate: json["publish_date"],
    subjectName: json["subject_name"],
    teacherName: json["teacher_name"],
    className: json["class_name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "file_path": filePath,
    "status": status,
    "term": term,
    "type": type,
    "publish_date": publishDate,
    "subject_name": subjectName,
    "teacher_name": teacherName,
    "class_name": className,
  };
}
