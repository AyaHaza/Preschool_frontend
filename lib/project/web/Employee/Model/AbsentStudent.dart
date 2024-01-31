import 'Model.dart';

class AbsentStudent extends Model {
  DateTime? date;
  String? justification;
  String? fullName;
  int? phone;


  AbsentStudent({
    id,
     this.date,
     this.justification,
     this.fullName,
     this.phone,
  }) :super(id: id);

  factory AbsentStudent.fromJson(Map<String, dynamic> json) => AbsentStudent(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    justification: json["justification"],
    fullName: json["fullName"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date==null ? " " : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "justification": justification ?? '',
    "fullName": fullName,
    "phone": phone,
  };
}