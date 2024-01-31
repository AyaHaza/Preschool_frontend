import 'package:get/get.dart';
import 'package:project/CONSTANT/size_config.dart';
import '../../Model/QuizeStudent.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';

class QSController extends GetxController{
//int id=7;
//QSController({required this.id});
  Map<int ,QuizeStudent>QuizeSt ={};

  @override
  Future<void> onInit() async {
    super.onInit();
    await Fetch();
  }

    var authEndpoint = "${AuthNetwork.baseUrl}/categories/Student/${SizeConfig.id_Cat}";

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
        QuizeStudent class1=QuizeStudent.fromJson(value);
        QuizeSt.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occ ure ! please Try Again! <$e>");
    }
  }


}