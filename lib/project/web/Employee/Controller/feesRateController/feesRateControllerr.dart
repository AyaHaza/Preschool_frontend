
import 'package:get/get.dart';
import 'package:project/project/web/Employee/Model/feesRate.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';

import '../../widgets/Dialogs/ErrorDialog.dart';
class feesRateControllerr extends GetxController{

  Map<int ,feesRate>feesRates ={};
  @override
  void onInit() async {
    await Fetch();
    super.onInit();

  }

  Future<void> Fetch() async {
    print("lllllllllllllllll");
    try {
      final responseData = await Network.fetch("${AuthNetwork.baseUrl}/feesRate");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      print(responseData);
      feesRates.clear();
      responseData['data'].forEach((value) {
        feesRate c=feesRate.fromJson(value);
        feesRates.addAll({1 : c });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }

}