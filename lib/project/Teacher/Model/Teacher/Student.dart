import '../Model.dart';

class Student extends Model {
   String? fullName;
      String? gender;
      DateTime? birthday;
      String? age;
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
     this.age,
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
        birthday:DateTime.parse(json["birthday"])  ,
        age: json["age"].toString(),
        phone: json["phone"].toString(),
        location: json["location"],
        siblingNo: json["siblingNo"].toString(),
        healthyFood: json["healthInfo"],
        bus_id: json["bus_id"].toString(),
  );

  @override
  Map<String, dynamic> toJson() => {
    "id":id,
        "fullName": fullName,
        "gender": gender,
        "motherName": motherName,
        "motherLastName": motherLastName,
        "birthday": birthday,
        "age": age,
        "phone": phone,
        "location": location,
        "siblingNo": siblingNo,
        "healthInfo": healthyFood,
        "bus_id": bus_id,
  };
}