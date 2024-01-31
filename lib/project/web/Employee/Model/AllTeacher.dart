import 'Model.dart';

class AllTeacher extends Model {
  String? fullName;
  




  AllTeacher({
    this.fullName
    ,
  

    id,
  }):super(id: id);

  @override
  factory AllTeacher.fromJson(Map<String, dynamic> json) => AllTeacher(
    id: json["id"],
    fullName: json["fullName"],


  );

  @override
  Map<String, dynamic> toJson() => {
    "id":id,
    "fullName": fullName,
  

  };
}