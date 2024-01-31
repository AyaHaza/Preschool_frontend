import 'Model.dart';

class AllCategories extends Model {

    String? name;
    String?img_name='';
    String? img='';





  AllCategories({
         this.name,
    this.img_name,
          this.img,

      id,
  }):super(id: id);


  factory AllCategories.fromJson(Map<String, dynamic> json) => AllCategories(
         id: json["id"],
         name: json["name"],
         img_name: json["img_name"],
    img: json["img"],


  );

  Map<String, dynamic> toJson() => {
    //"id": id,
         "id": id,
        "name": name,
         "img_name":img_name,
        "img": img,

  };
}
