import '../../Model/message.dart'as f;

import 'package:get/get.dart';
import '../../Model/LateNotification.dart';
import '../../Model/LateStudentInfo.dart';
import '../../Model/chat_user.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/Network.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
import '../Advertisement/Management/apis.dart';
class LateNotifyController extends GetxController{

  static const fetchEndpoint = "${AuthNetwork.baseUrl}/send/notification";
  static const DeleteEndpoint = "${AuthNetwork.baseUrl}/remove/notification";

  Map<int ,LateNotification>Notifications ={};

  @override
  void onInit() async {
    await Fetch();
    super.onInit();

  }

  Future<void> Fetch() async {
    try {
      final responseData = await Network.fetch(fetchEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      Notifications.clear();
      responseData['data'].forEach((value) {
        LateNotification temp=LateNotification.fromJson(value);
        Notifications.addAll({temp.id! :temp});
      });
      print("Dddddddddddddddddddddddddddd");
      update();
      print(responseData['data']);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<void> Delete(int id) async {
    try {
      final responseData = await Network.Delete(id,DeleteEndpoint);

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      Notifications.remove(id);
      update();

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  void send(int id, List<LateStudentsInfo>? studentsInfo) async {
     String all=" Warning **** Students That should pay at least current_remaining_payment ****'\n";
     studentsInfo!.forEach((element) {
       String student ="name : ${element.name} , current_amount :${element.currentAmount} '\n "
           "current_remaining_payment : ${element.currentRemainingPayment} ,total remaining payment : ${element.totalRemainingPayment} '\n'\n";
       all+=student;
     });
     ChatUser School=APIs.list.where((element) => element.name.compareTo("School")==0).first;
   await  APIs.sendMessage(School,all, f.Type.text);
   Delete(id);
     Dialogs.Success("Message sent Successfully ");

  }
}