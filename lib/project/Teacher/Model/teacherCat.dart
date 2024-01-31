import 'Model.dart';

class QuizeTeacher extends Model {
  String ?text;
  String? audio;
  String ?categoryId;

  String ?correctAnswerText;
  String ?correctAnswerSymbol;


  QuizeTeacher({
    this.text,
    this.audio,
    this.categoryId,

    this.correctAnswerText,
    this.correctAnswerSymbol,
    id,
  }) :super(id: id);


  factory QuizeTeacher.fromJson(Map<String, dynamic> json) =>
      QuizeTeacher(
        id: json["id"],
        text: json["text"].toString(),
        audio: json["audio"],
        categoryId: json["category_id"].toString(),
        correctAnswerText: json["correct_answer_text"].toString(),
        correctAnswerSymbol: json["correct_answer_symbol"].toString(),


      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "text": text,
        "audio": audio,
        "category_id": categoryId,
        "correct_answer_text": correctAnswerText,
        "correct_answer_symbol": correctAnswerSymbol,


      };
}