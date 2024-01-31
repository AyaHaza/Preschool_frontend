
import 'package:get/get.dart';
import '../../Model/Student.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../view/StudentMangement/StudentAll/StudentAll.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
class StudentController extends GetxController{


  Map<int ,Student>Classes ={};


  @override
  Future<void> onInit() async {
    super.onInit();
    await Fetch();
  }

  static const authEndpoint = "${AuthNetwork.baseUrl}/student";
  static const AllEndpoint = "${AuthNetwork.baseUrl}/students";

  Future<void> Fetch() async {
    try {
      final responseData = await Network.fetch(AllEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      Classes.clear();
      responseData['data'].forEach((value) {
        Student class1=Student.fromJson(value);
        Classes.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }

}