import 'Model.dart';

class Registery extends Model {
  String? fullName;
  String? gender;
  DateTime? birthday;
  String? phone;
  String? location;
  String? healthyFood;
  String? degree;
  String? specialization;
  String? role;
  String?status;


  Registery({
    this.fullName,
    this.gender,
    this.birthday,
    this.phone,
    this.location,
    this.healthyFood,
    this.degree,
    this.specialization,
    this.role,
    this.status,
    id,
  }):super(id: id);

  @override
  factory Registery.fromJson(Map<String, dynamic> json) => Registery(

    fullName: json["fullName"],
    gender:json["gender"],
    birthday:DateTime.parse(json["birthday"]),
    phone: json["phone"].toString(),
    location: json["location"],
    healthyFood: json["healthInfo"],
    degree: json["degree"].toString(),
    specialization:json["specialization"] ,
    role:json['account_info']!=null? json['account_info']['role'].toString():"",
    status:json['account_info']!=null? json['account_info']['status'].toString():"",
    id: json["id"],
  );

  @override
  Map<String, dynamic> toJson() => {
    'fullName': '$fullName',
    'gender': '$gender',
    "birthday": "${birthday!.day.toString().padLeft(2, '0')}/${birthday!.month.toString().padLeft(2, '0')}/${birthday!.year.toString().padLeft(4, '0')}",
    'phone': '$phone',
    'location': '$location',
    'healthyFood': '$healthyFood',
    'degree': '$degree',
    'specialization': '$specialization',
    'role': '$role',
    "id": id,
  };
}