
import 'package:get/get.dart';

import '../../Model/AllTeacher.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';

import '../../widgets/Dialogs/ErrorDialog.dart';
class AllTeacherController extends GetxController{


  Map<int ,AllTeacher>AllTeachers ={};

String class_idMsg="";
  String teacher_idMsg="";
  String subjectsMsg="";

  @override
  Future<void> onInit() async {
    super.onInit();
    await Fetch();
  }



  Future<void> Fetch() async {
    try {
      final responseData = await Network.fetch('${AuthNetwork.baseUrl}/teachers');
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      AllTeachers.clear();
      responseData['data'].forEach((value) async {
        AllTeacher class1=AllTeacher.fromJson(value);
      AllTeachers.addAll({class1.id! : class1 });



      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
 

}