


import 'Model.dart';
class Notification extends Model {
  int? notificationId;
  String? name;
  int? currentAmount;
  int? currentRemainingPayment;
  int? totalRemainingPayment;

  Notification({
     this.notificationId,
     this.name,
     this.currentAmount,
     this.currentRemainingPayment,
     this.totalRemainingPayment,
    id
  }):super(id: id);


  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    notificationId: json["notification_id"],
    id: json["id"],
    name: json["name"],
    currentAmount: json["current_amount"],
    currentRemainingPayment: json["current_remaining_payment"],
    totalRemainingPayment: json["total_remaining_payment"],
  );

  Map<String, dynamic> toJson() => {
    "notification_id": notificationId,
    "id": id,
    "name": name,
    "current_amount": currentAmount,
    "current_remaining_payment": currentRemainingPayment,
    "total_remaining_payment": totalRemainingPayment,
  };
}
