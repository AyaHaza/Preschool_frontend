import 'Model.dart';

class AllCategories extends Model {

    String? name;
    String? img;
    DateTime? createdAt;
    DateTime ?updatedAt;




  AllCategories({
       this.name,
          this.img,
         this.createdAt,
         this.updatedAt,
      id,
  }):super(id: id);


  factory AllCategories.fromJson(Map<String, dynamic> json) => AllCategories(
   id: json["id"],
        name: json["name"],
        img: json["img"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),

  );

  Map<String, dynamic> toJson() => {
    //"id": id,
     "id": id,
        "name": name,
        "img": img,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),

  };
}
// To parse this JSON data, do
//
//     final allCategories = allCategoriesFromJson(jsonString);
//
// import 'dart:convert';
//
// AllCategories allCategoriesFromJson(String str) => AllCategories.fromJson(json.decode(str));
//
// String allCategoriesToJson(AllCategories data) => json.encode(data.toJson());
//
// class AllCategories {
//   List<Datum> data;
//   String status;
//
//   AllCategories({
//     required this.data,
//     required this.status,
//   });
//
//   factory AllCategories.fromJson(Map<String, dynamic> json) => AllCategories(
//     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     status: json["status"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     "status": status,
//   };
// }
//
// class Datum {
//   int id;
//   String name;
//   String img;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   Datum({
//     required this.id,
//     required this.name,
//     required this.img,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     id: json["id"],
//     name: json["name"],
//     img: json["img"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "img": img,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
