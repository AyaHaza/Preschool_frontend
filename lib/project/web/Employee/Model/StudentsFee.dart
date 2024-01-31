import 'Model.dart';

class Fees extends Model {
  String? name;
  int? fees;
  int? currentAmount;
  int? remind;
  int? busFees;
  int? studyDiscount;
  int? busDiscount;
  String? status;

  Fees({
    id,
     this.name,
     this.fees,
     this.currentAmount,
     this.remind,
     this.busFees,
     this.studyDiscount,
     this.busDiscount,
     this.status,
  }):super(id: id);

  factory Fees.fromJson(Map<String, dynamic> json) => Fees(
    id: json["id"],
    name: json["name"],
    fees: json["fees"],
    currentAmount: json["current_amount"],
    remind: json["remind"],
    busFees: json["bus_fees"],
    studyDiscount: json["study_discount"],
    busDiscount: json["bus_discount"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "fees": fees,
    "current_amount": currentAmount,
    "remind": remind,
    "bus_fees": busFees,
    "study_discount": studyDiscount,
    "bus_discount": busDiscount,
    "status": status,
  };
}
