import 'Model.dart';

class Student extends Model {
  String? fullName;
  String? gender;
  String? birthday;
  String? phone;
  String? location;
  String? healthyFood;
  String? motherName;
  String? motherLastName;
  String? siblingNo;
  String?bus_id;
  String?bus_discount;
  String?study_discount;


  Student({
    this.fullName,
    this.gender,
    this.birthday,
    this.phone,
    this.location,
    this.healthyFood,
    this.motherName,
    this.motherLastName,
    this.siblingNo,
    this.bus_id,
    this.bus_discount,
    this.study_discount,
    id,
  }):super(id: id);

  @override
  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json["id"],
    fullName: json["fullName"],
    gender: json["gender"],
    motherName: json["motherName"],
    motherLastName: json["motherLastName"],
    birthday:json["birthday"]  ,
    phone: json["phone"].toString(),
    location: json["location"],
    siblingNo: json["siblingNo"].toString(),
    healthyFood: json["healthInfo"],
    bus_id: json["bus_registry"].toString(),
    bus_discount: json["bus_discount"].toString(),
    study_discount: json["study_discount"].toString(),
  );

  @override
  Map<String, dynamic> toJson() => {
    "id":id,
    "fullName": fullName,
    "gender": gender,
    "motherName": motherName,
    "motherLastName": motherLastName,
    "birthday": birthday,
    "phone": phone,
    "location": location,
    "siblingNo": siblingNo,
    "healthInfo": healthyFood,
    "bus_registry": bus_id,
    "bus_discount":bus_discount,
    "study_discount":study_discount,

  };
}