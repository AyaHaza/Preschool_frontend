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
  };
}