
import 'package:get/get.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../view/RegistryMangement/RegisteryAll/RegisteryAll.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import '../../Model/Registery.dart';
class RegisteryController extends GetxController{

  Map<int ,Registery>Classes ={};

  @override
  Future<void> onInit() async {
    super.onInit();
    await Fetch();
  }

  static const authEndpoint = "${AuthNetwork.baseUrl}/employee";
  static const AllEndpoint = "${AuthNetwork.baseUrl}/employees";

  Future<void> Fetch() async {
    try {
      final responseData = await Network.fetch(AllEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      Classes.clear();
      responseData['data'].forEach((value) {
        Registery class1=Registery.fromJson(value);
        Classes.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }


}