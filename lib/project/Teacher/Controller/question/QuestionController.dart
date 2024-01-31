
import 'package:get/get.dart';
import 'package:project/CONSTANT/size_config.dart';

import '../../Model/teacherCat.dart';
import '../../Model/teacherQuestion.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';

class QuestionTeacherController extends GetxController{
//int id=7;
//QSController({required this.id});
  Map<int ,QuestionTeacher>QuestioSeachert ={};


  @override
  Future<void> onInit() async {
    super.onInit();
    await Fetch();

  }

  Future<void> Fetch() async {
    print(SizeConfig.id_question);
    //print(authEndpoint);
    try {
      print('lllllllllllllllllllll');
      // print(id);
      final responseData =  await Network.fetch('${AuthNetwork.baseUrl}/questions/${SizeConfig.id_question}');
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      QuestioSeachert.clear();
      responseData['data'].forEach((value) {
        QuestionTeacher class1=QuestionTeacher.fromJson(value);
        QuestioSeachert.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occ ure ! please Try Again! <$e>");
    }
  }}
//
//
// Future<void> uploadQ(text,answertexts,answerImages,correct_answer_symbol,audio,category_id) async {
//   try {
//     print('llllllllllllllllllllllllllllllllllll');
//
//
//     final responseData = await Network.uploadQ(text,answertexts,answerImages,correct_answer_symbol,audio,category_id,"${AuthNetwork.baseUrl}/questions");
//
//     QuizeTeacher class2=QuizeTeacher.fromJson(responseData['data']);
//     // QuizeSt.addAll({class2.id! : class2 });
//     update();
//     Dialogs.Success("Added Successfully!");
//
//   }  catch (e) {
//     print(e);
//     Dialogs.Error("ERROR occure ! please Try Again! < $e>");
//   }
//
// }
//
//
// }