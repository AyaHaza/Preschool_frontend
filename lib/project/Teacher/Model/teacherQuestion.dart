import 'Model.dart';

class QuestionTeacher extends Model {
  String ?text='';
  String? audio='';
  String? correct_Symbol='';
  String ?categoryId='';
  List<Answer>? answers=[];




  QuestionTeacher({
    this.text,
    this.audio,
    this.categoryId,
    this.answers,
    this.correct_Symbol,

    id,
  }):super(id: id);


  factory QuestionTeacher.fromJson(Map<String, dynamic> json) => QuestionTeacher(
    id: json["id"],
    text: json["text"],
    audio: json["audio"],
    correct_Symbol: json["correct_Symbol"],
    categoryId: json["category_id"].toString(),
    answers: List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),



  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "audio": audio,
    "category_id": categoryId,
    "answers": List<dynamic>.from(answers!.map((x) => x.toJson())),
"correct_Symbol":correct_Symbol,


  };
}
class Answer {
  int? id;
  String ?text;
  String ?img;
  String ?imgName;
  String ?symbol;
  int ?correctAnswer;
  int ?questionId;


  Answer({
    this.id,
    this.text,
    this.img,
    this.imgName,
    this.symbol,
    this.correctAnswer,
    this.questionId,

  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    id: json["id"],
    text: json["text"],
    img: json["img"],
    imgName: json["img_name"],
    symbol: json["symbol"],
    correctAnswer: json["correct_answer"],
    questionId: json["question_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "img": img,
    "img_name":imgName,
    "symbol": symbol,
    "correct_answer": correctAnswer,
    "question_id": questionId,
  };
}
