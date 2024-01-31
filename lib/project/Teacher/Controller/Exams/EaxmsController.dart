import 'package:get/get.dart';
import 'package:project/CONSTANT/size_config.dart';
import '../../Model/AllExams.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
class ExamConrtroller extends GetxController{


  Map<int ,AllExams>AllExam ={};


  @override
  Future<void> onInit() async {
    super.onInit();
    await Fetch();
  }


  Future<void> upload(ppuplishDate,statuss,term,type,datee,file) async {
    try {
      print('llllllllllllllllllllllllllllllllllll');


      final responseData = await Network.uploadExam(ppuplishDate,statuss,term,type,datee,file,'${AuthNetwork.baseUrl}/exams');

      AllExams class2=AllExams.fromJson(responseData['data']);
      AllExam.addAll({class2.id! : class2 });
      update();
      Dialogs.Success("Added Successfully!");

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Do Not Leave Aany Thing Empty Becuase All Fieldes Are Required So Try Again ");
    }

  }

  Future<void> EditFile(ppuplishDate,statuss,term,type,datee,file) async {
    try {
      print('llllllllllllllllllllllllllllllllllll');


      final responseData = await Network.uploadExam(ppuplishDate,statuss,term,type,datee,file,'${AuthNetwork.baseUrl}/exams/${SizeConfig.id_exam}');

      AllExams class2=AllExams.fromJson(responseData['data']);
      AllExam.addAll({class2.id! : class2 });
      update();
      Dialogs.Success("Edited Successfully!");

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! < $e>");
    }

  }

  Future<void> Fetch() async {
    print("${AuthNetwork.baseUrl}/exams/${SizeConfig.id_subjectExam}");
    try {
     
      final responseData = await Network.fetch("${AuthNetwork.baseUrl}/exams/${SizeConfig.id_subjectExam}");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      AllExam.clear();
      responseData['data'].forEach((value) {
        AllExams class1=AllExams.fromJson(value);
        AllExam.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }

  Future<void> Delete(int id) async {
    try {
      final responseData = await Network.Delete(id,"${AuthNetwork.baseUrl}/exams");

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      AllExam.remove(id);
      update();
      Dialogs.Success(responseData['data']);

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }


}