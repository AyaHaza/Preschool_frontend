import 'Model.dart';

class AllHomework extends Model {
  
  String? page_number;
  String ?description;
  String ?lesson_id;




  AllHomework({
    this.page_number,
    this.description,
    this.lesson_id,
    
    id,
  }) :super(id: id);


  factory AllHomework.fromJson(Map<String, dynamic> json) =>
      AllHomework(
        id: json["id"],
        page_number: json["page_number"].toString(),
        description: json["description"].toString(),
        lesson_id: json["lesson_id"].toString(),
       


      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "page_number": page_number,
        "description": description,
        "lesson_id": lesson_id,
 


      };
}