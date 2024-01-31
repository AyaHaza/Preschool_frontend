import 'package:get/get.dart';
import 'package:project/CONSTANT/size_config.dart';

import '../../Model/teacherCat.dart';
import '../../Model/teacherQuestion.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';

class QuizeTeacherController extends GetxController{
//int id=7;
//QSController({required this.id});
  Map<int ,QuizeTeacher>QuizeSt ={};


  @override
  Future<void> onInit() async {
    super.onInit();
    await Fetch();

  }

    var authEndpoint = "${AuthNetwork.baseUrl}/categories/teacher/${SizeConfig.id_Cat}";

 Future<void> Fetch() async {
   print(SizeConfig.id_Cat);
   print(authEndpoint);
    try {
      print('lllllllllllllllllllll');
      // print(id);
      final responseData =  await Network.fetch('$authEndpoint');
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      QuizeSt.clear();
      responseData['data'].forEach((value) {
        QuizeTeacher class1=QuizeTeacher.fromJson(value);
        QuizeSt.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occ ure ! please Try Again! <$e>");
    }
  }
  Future<void> Delete(int id) async {
    try {
      final responseData = await Network.Delete(id,"${AuthNetwork.baseUrl}/questions");

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      QuizeSt.remove(id);
      update();
      Dialogs.Success(responseData['message']);

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> uploadQ(text,answertexts,answerImages,correct_answer_symbol,audio,category_id) async {
    try {
      print('llllllllllllllllllllllllllllllllllll');


      final responseData = await Network.uploadQ(text,answertexts,answerImages,correct_answer_symbol,audio,category_id,"${AuthNetwork.baseUrl}/questions");

      QuizeTeacher class2=QuizeTeacher.fromJson(responseData['data']);
       QuizeSt.addAll({class2.id! : class2 });
      update();
      Dialogs.Success("Added Successfully!");

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! < $e>");
    }

  }
  Future<void> EditQ(text,answertexts,answerImages,correct_answer_symbol,audio,category_id) async {
    try {
      print('llllllllllllllllllllllllllllllllllll');


      final responseData = await Network.uploadQ(text,answertexts,answerImages,correct_answer_symbol,audio,category_id,"${AuthNetwork.baseUrl}/questions/${SizeConfig.id_question}");

      QuizeTeacher class2=QuizeTeacher.fromJson(responseData['data']);
      QuizeSt.addAll({class2.id! : class2 });
      update();
      Dialogs.Success("Edited Successfully!");

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! < $e>");
    }

  }

}