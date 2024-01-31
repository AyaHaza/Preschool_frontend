
import 'package:get/get.dart';

import '../../Model/StudentClasses.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';

import '../../widgets/Dialogs/ErrorDialog.dart';
class unStudentClassesController extends GetxController{


  Map<int ,StudentClasses>unStudenClass ={};
  var isSWSlect=false;






  @override
  Future<void> onInit() async {
    super.onInit();
    await Fetch();
  }

  static var authEndpoint = "${AuthNetwork.baseUrl}/unassignes/students";

  //http://192.168.1.103:80/api/assign/student/${SizeConfig.id_Class}
  // Future<void> Store(StudentClasses class1) async {
  //   try {
  //
  //
  //     final responseData = await Network.Store(class1,'${authEndpoint}/assign/student/${SizeConfig.id_Class}');
  //     if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
  //
  //
  //
  //       return;
  //     }
  //     // print()ك
  //     StudentClasses class2=StudentClasses.fromJson(responseData['data']);
  //     unStudenClass.addAll({class2.id! : class2 });
  //     update();
  //     Dialogs.Success("Added Successfully!");
  //   }  catch (e) {
  //     print(e);
  //     Dialogs.Error("ERROR occure ! please Try Again! < $e>");
  //   }
  // }

  Future<void> Fetch() async {
    try {
      final responseData = await Network.fetch('${AuthNetwork.baseUrl}/unassignes/students');
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      unStudenClass.clear();
      responseData['data'].forEach((value) {
        StudentClasses class1=StudentClasses.fromJson(value);
        unStudenClass.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }

 

}