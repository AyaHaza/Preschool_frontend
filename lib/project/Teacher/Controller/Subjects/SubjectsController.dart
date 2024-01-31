import 'package:get/get.dart';
import '../../../../../CONSTANT/size_config.dart';
import '../../Model/AllSubjects.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';

class SubjectsrController extends GetxController{

  Map<int ,AllSubjectTeACHER>AllSubjectTeACHERs ={};


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
      final responseData =  await Network.fetch('${AuthNetwork.baseUrl}/teacher/subjects');
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      AllSubjectTeACHERs.clear();
      responseData['data'].forEach((value) {
        AllSubjectTeACHER class1=AllSubjectTeACHER.fromJson(value);
        AllSubjectTeACHERs.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occ ure ! please Try Again! <$e>");
    }
  }
}