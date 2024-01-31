import 'Model.dart';

class AllExams extends Model {
  
  String? name;
  String ?file_path;
String? status;
  String ?term;
  String? type;




  AllExams({
    this.name,
    this.file_path,
    this.status,
    this.term,
    this.type,
    
    id,
  }) :super(id: id);


  factory AllExams.fromJson(Map<String, dynamic> json) =>
      AllExams(
        id: json["id"],
        name: json["name"],
        file_path: json["file_path"].toString(),
        status: json["status"],
        term: json["term"],
        type: json["type"],
       


      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "level_id": file_path,
        "status":status,
        "term":term,
        "type":type,
 


      };
}