import 'Model.dart';

class QuizeStudent extends Model {
 String ?text;
    String? audio;
    int ?categoryId;
    List<Answer>? answers;
    String ?correctAnswerText;
    String ?correctAnswerSymbol;



  QuizeStudent({
      this.text,
         this.audio,
         this.categoryId,
         this.answers,
         this.correctAnswerText,
         this.correctAnswerSymbol,
      id,
  }):super(id: id);


  factory QuizeStudent.fromJson(Map<String, dynamic> json) => QuizeStudent(
     id: json["id"],
        text: json["text"],
        audio: json["audio"],
        categoryId: json["category_id"],
        answers: List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
        correctAnswerText: json["correct_answer_text"],
        correctAnswerSymbol: json["correct_answer_symbol"],
   

  );

  Map<String, dynamic> toJson() => {
       "id": id,
        "text": text,
        "audio": audio,
        "category_id": categoryId,
        "answers": List<dynamic>.from(answers!.map((x) => x.toJson())),
        "correct_answer_text": correctAnswerText,
        "correct_answer_symbol": correctAnswerSymbol,
   

  };
}
class Answer {
    int? id;
    String ?text;
    String ?img;
    String ?symbol;
    int ?correctAnswer;
    int ?questionId;
    DateTime? createdAt;
    DateTime ?updatedAt;

    Answer({
         this.id,
         this.text,
         this.img,
         this.symbol,
         this.correctAnswer,
         this.questionId,
         this.createdAt,
         this.updatedAt,
    });

    factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["id"],
        text: json["text"],
        img: json["img"],
        symbol: json["symbol"],
        correctAnswer: json["correct_answer"],
        questionId: json["question_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "img": img,
        "symbol": symbol,
        "correct_answer": correctAnswer,
        "question_id": questionId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
