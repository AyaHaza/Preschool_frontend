import 'Model.dart';

class Config extends Model {

  DateTime? date;
  int? amount;

  Config({
     this.date,
     this.amount,
    id,
  }):super(id: id);


  factory Config.fromJson(Map<String, dynamic> json) => Config(
    date: DateTime.parse(json["date"]),
    amount: json["amount"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "amount": amount,
    "id": id,
  };
}