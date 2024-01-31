import 'Model.dart';

class AllSubjectTeACHER extends Model {
  
  String? name;
  String ?level_id;




  AllSubjectTeACHER({
    this.name,
    this.level_id,
    
    id,
  }) :super(id: id);


  factory AllSubjectTeACHER.fromJson(Map<String, dynamic> json) =>
      AllSubjectTeACHER(
        id: json["id"],
        name: json["name"],
        level_id: json["level_id"].toString(),
       


      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "level_id": level_id,
 


      };
}