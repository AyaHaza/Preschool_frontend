import 'package:get/get.dart';
import '../../Model/AlllCategory.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
class CatController extends GetxController{


  Map<int ,AllCategories>AllCateg ={};


  @override
  Future<void> onInit() async {
    super.onInit();
    await Fetch();
  }

  static const authEndpoint = "${AuthNetwork.baseUrl}/categories";


  Future<void> upload(name,img) async {
    try {
      print('llllllllllllllllllllllllllllllllllll');


      final responseData = await Network.upload(name,img,'${authEndpoint}');

      AllCategories class2=AllCategories.fromJson(responseData['data']);
      AllCateg.addAll({class2.id! : class2 });
      update();
      Dialogs.Success("Added Successfully!");

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! < $e>");
    }

  }

  Future<void> EditFile(name,img,id) async {
    try {
      print('llllllllllllllllllllllllllllllllllll');


      final responseData = await Network.upload(name,img,'${authEndpoint}/${id}');

      AllCategories class2=AllCategories.fromJson(responseData['data']);
      AllCateg.addAll({class2.id! : class2 });
      update();
      Dialogs.Success("Edited Successfully!");

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! < $e>");
    }

  }

  Future<void> EditFilessss(name,id,nameImg) async {
    try {
      print('llllllllllllllllllllllllllllllllllll');


      final responseData = await Network.uploadssss(name,'${authEndpoint}/${id}',nameImg);

      AllCategories class2=AllCategories.fromJson(responseData['data']);
      AllCateg.addAll({class2.id! : class2 });
      update();
      Dialogs.Success("Edited Successfully!");

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! < $e>");
    }

  }
  Future<void> Fetch() async {
    print("${AuthNetwork.baseUrl}/categories");
    try {
      print(authEndpoint);
      final responseData = await Network.fetch("${AuthNetwork.baseUrl}/categories");
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      AllCateg.clear();
      responseData['data'].forEach((value) {
        AllCategories class1=AllCategories.fromJson(value);
        AllCateg.addAll({class1.id! : class1 });
      });
      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }


  Future<void> Delete(int id) async {
    try {
      final responseData = await Network.Delete(id,authEndpoint);

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      AllCateg.remove(id);
      update();
      Dialogs.Success(responseData['message']);

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }


}