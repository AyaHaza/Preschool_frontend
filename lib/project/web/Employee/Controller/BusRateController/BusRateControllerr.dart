
import 'package:get/get.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';

import '../../Model/busRate.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
class BusRateControllerr extends GetxController{

  Map<int ,BusRate>BusRates ={};
  @override
  void onInit() async {
    await Fetch();
    super.onInit();

  }

  Future<void> Fetch() async {
    print("lllllllllllllllll");
    try {
      final responseData = await Network.fetch("${AuthNetwork.baseUrl}/busRate");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      print(responseData);
      BusRates.clear();
      responseData['data'].forEach((value) {
        BusRate c=BusRate.fromJson(value);
        BusRates.addAll({1 : c });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }

}