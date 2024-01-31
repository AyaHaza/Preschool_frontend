
import 'Model.dart';

class Report extends Model{
  String? fileName;
  String? url;
  String? type;


  Report({
     this.fileName,
     this.url,
     this.type,
    id
  }):super(id: id);

  factory Report.fromJson(Map<String, dynamic> json) => Report(
    id: json["id"],
    fileName: json["fileName"],
    url: json["url"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fileName": fileName,
    "url": url,
    "type": type,
  };
}