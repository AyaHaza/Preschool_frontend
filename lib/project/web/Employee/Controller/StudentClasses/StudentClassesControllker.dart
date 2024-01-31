
import 'package:get/get.dart';

import '../../../../../CONSTANT/size_config.dart';
import '../../Model/StudentClasses.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';

import '../../widgets/Dialogs/ErrorDialog.dart';
class StudentClassesController extends GetxController{


  Map<int ,StudentClasses>StudenClass ={};





  @override
  Future<void> onInit() async {
    super.onInit();
    await Fetch();
  }

  static var authEndpoint = "${AuthNetwork.baseUrl}/class/students/${SizeConfig.id_Class}";


  //
  // Future<void> Store(StudentClasses class1) async {
  //   try {
  //
  //
  //     final responseData = await Network.Store(class1,'${authEndpoint}/store');
  //     if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
  //
  //
  //
  //       return;
  //     }
  //     // print()ك
  //     StudentClasses class2=StudentClasses.fromJson(responseData['data']);
  //     StudenClass.addAll({class2.id! : class2 });
  //     update();
  //     Dialogs.Success("Added Successfully!");
  //   }  catch (e) {
  //     print(e);
  //     Dialogs.Error("ERROR occure ! please Try Again! < $e>");
  //   }
  // }
  //
  Future<void> Fetch() async {
    print(SizeConfig.id_Class);
    try {
      final responseData = await Network.fetch('${AuthNetwork.baseUrl}/class/students/${SizeConfig.id_Class}');
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      StudenClass.clear();
      responseData['data'].forEach((value) {
        StudentClasses class1=StudentClasses.fromJson(value);
        StudenClass.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }

  Future<void> Delete(int id) async {
    try {
      final responseData = await Network.Delete(id,"${AuthNetwork.baseUrl}/remove/students/${SizeConfig.id_student}");

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      StudenClass.remove(SizeConfig.id_student);
      update();
      Dialogs.Success(responseData['data']);

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  // Future<void>? DeleteEmp(id)async{
  //
  //
  //   await Network.DeleteEmp(id,authEndpoint);
  //
  //   update();
  // }

}