

import 'Model.dart';
class LateStudentsInfo extends Model {
  String? name;
  int? currentAmount;
  int? currentRemainingPayment;
  int? totalRemainingPayment;

  LateStudentsInfo({
    required this.name,
    required this.currentAmount,
    required this.currentRemainingPayment,
    required this.totalRemainingPayment,
    id
  }):super(id: id);


  factory LateStudentsInfo.fromJson(Map<String, dynamic> json) => LateStudentsInfo(
    id: json["id"],
    name: json["name"],
    currentAmount: json["current_amount"],
    currentRemainingPayment: json["current_remaining_payment"],
    totalRemainingPayment: json["total_remaining_payment"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "current_amount": currentAmount,
    "current_remaining_payment": currentRemainingPayment,
    "total_remaining_payment": totalRemainingPayment,
  };
}
