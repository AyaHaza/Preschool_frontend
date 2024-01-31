
import 'package:get/get.dart';
import '../../../../../CONSTANT/size_config.dart';
import '../../Model/TeacherClasses.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../view/Subject/SubjectPage.dart';

import '../../Service/NetWork.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';

class TeacherClassesController extends GetxController{

  //static const authEndpoint = "${AuthNetwork.baseUrl}/teacher/subject/in/class/";

  Map<int ,TeacherClasses>teacherClasses ={};
  String nameMsg="";
  String levelMsg="";

  @override
  void onInit() async {
    super.onInit();
    await Fetch();
  }

  Future<void> Fetch() async {
    try {
      print(SizeConfig.id_Teacher);
      final responseData = await Network.fetch("${AuthNetwork.baseUrl}/teacher/classes/${SizeConfig.id_Teacher}");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      teacherClasses.clear();
      responseData['data'].forEach((value) {
        TeacherClasses subject=TeacherClasses.fromJson(value);
        teacherClasses.addAll({subject.id! :subject});
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
 Future<void> Delete(int id) async {
    try {
      print("object${id}");
      final responseData = await Network.Delete(id,"${AuthNetwork.baseUrl}/teacher/all/subject/in/class/${SizeConfig.id_ClassSub}");

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      teacherClasses.remove(SizeConfig.id_ClassSub);
      update();
      Dialogs.Success(responseData['data']);

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }

}