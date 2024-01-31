
import 'package:get/get.dart';
import '../../Model/Bus.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../view/BusMangement/BusAll/BusAll.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
class VRPController extends GetxController{


  static const authEndpoint = "${AuthNetwork.baseUrl}/vrp";

  Future<void> Assign() async {
    try {
      final responseData = await Network.fetch(authEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw responseData['data'];
      }
      Dialogs.SuccessEdit("ReAssigned Successfully!",null);
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! <$e>");
    }
  }




}