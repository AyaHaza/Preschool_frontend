import 'Model.dart';

class Fee extends Model {
  int? amount;
  int? studentId;
  int? remaind;
  String? employee_name;

  Fee({
     this.amount,
     this.studentId,
     this.remaind,
    this.employee_name,
    id,
  }):super(id: id);

  factory Fee.fromJson(Map<String, dynamic> json) => Fee(
    amount: json["amount"],
    studentId: json["student_id"],
    remaind: json["remaind"],
    id: json["id"],
    employee_name: json["employee_name"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "student_id": studentId,
    "remaind": remaind,
    "id": id,
  };
}
