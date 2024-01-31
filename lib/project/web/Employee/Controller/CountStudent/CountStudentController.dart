
import 'package:get/get.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';

import '../../Model/Cont.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
class StudentCountController extends GetxController{

  Map<int ,Count>Counts ={};
  @override
  void onInit() async {
    await Fetch();
    super.onInit();

  }

  Future<void> Fetch() async {
    print("lllllllllllllllll");
    try {
      final responseData = await Network.fetch("${AuthNetwork.baseUrl}/count");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      print(responseData);
      Counts.clear();
      responseData['data'].forEach((value) {
        Count c=Count.fromJson(value);
        Counts.addAll({1 : c });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }

}