import 'Model.dart';

class AllLesson extends Model {
  
  String? title;
  String ?semester;
  String ?number;
  String?subject_id;
  String?status;

  



  AllLesson({
    this.title,
    this.semester,
    this.number,
    this.subject_id,
    this.status,
    id,
  }) :super(id: id);


  factory AllLesson.fromJson(Map<String, dynamic> json) =>
      AllLesson(
        id: json["id"],
        title: json["title"],
        semester: json["semester"].toString(),
        number: json["number"].toString(),
        subject_id:json["subject_id"].toString(),
       status: json.containsKey("status") ? json["status"] :"",
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "title": title,
        "semester": semester,
        "number": number,
        "subject_id":subject_id,
        "status":status
      };
}