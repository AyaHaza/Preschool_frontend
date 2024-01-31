import 'Model.dart';
import 'LateStudentInfo.dart';
class LateNotification extends Model {
  DateTime? date;
  int? amount;
  int? notificationId;
  List<LateStudentsInfo>? studentsInfo=[];

  LateNotification({
     this.date,
     this.amount,
     this.notificationId,
     this.studentsInfo,
  }):super(id: notificationId);


  factory LateNotification.fromJson(Map<String, dynamic> json) => LateNotification(
    date: DateTime.parse(json["date"]),
    amount: json["amount"],
    notificationId: json["notification_id"],
    studentsInfo: List<LateStudentsInfo>.from(json["students_info"].map((x) => LateStudentsInfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "amount": amount,
    "notification_id": notificationId,
    "students_info": List<dynamic>.from(studentsInfo!.map((x) => x.toJson())),
  };
}
