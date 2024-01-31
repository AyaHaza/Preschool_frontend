import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import '../../Model/User.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';

import '../../view/Authentication/login1.dart';
class AuthController extends GetxController{
  User? user=User(id:88,token: "222|zT0RNhFnlsso8yu0AbBF76GPKZvdiralX80qvBhI");
  bool isAuth =false;
  static const authEndpoint = "${AuthNetwork.baseUrl}/profile";

  String nameMsg="";
  String photoMsg="";
  String PasswordMsg="";
  String CurrentPasswordMsg="";


  @override
  void onInit()async{
    await tryAutoLogin();

    super.onInit();

  }

  Future<String?> login(String? password, String? name) async {
    try {
      final responseData = await AuthNetwork.Login(password, name);
      user = User.fromJson(responseData['data']);
      user!.token = responseData['access_token'];
      AuthNetwork.StoreData(user!.token!, user!.id!);
      isAuth=true;
      update();
      await Fetch();

    } on DioError catch (e) {throw e;}
    catch (e) {throw e;}
  }



  Future<void> tryAutoLogin() async {
    MapEntry? data= await AuthNetwork.getData();
    if(data==null){
      isAuth=false;
      update();
    }else {
      print("Auto Login");
      isAuth = true;
      user = User(id: data!.key, token: data!.value);
      await Fetch();
      update();
    }
  }


  Future<void> logout() async {
    if(user!=null) {
      await AuthNetwork.logout(user!.token);
    }
    user=null;
    isAuth=false;
    Get.toNamed(Login1.routeName);

    update();
  }
  Future<void> Fetch() async {
    try {
      final responseData = await Network.fetch(authEndpoint);
      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        throw"error";
      }
      String? token =user!.token;
      user =User.fromJson(responseData['data']);
      user!.token=token;

      update();
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! <$e>");
    }
  }
  Future<void> Edit(User EditedData) async {
    nameMsg="";
    photoMsg="";
    PasswordMsg="";
    CurrentPasswordMsg="";
    try {
      final responseData = await Network.Store(EditedData,"$authEndpoint/${EditedData.id}");

      if (int.parse(responseData['status'].toString()).isGreaterThan(300) ) {
        if(responseData.containsKey('name')) {
          nameMsg = responseData['name'].toString();
        }
        if(responseData.containsKey('photo')) {
          photoMsg= responseData['photo'].toString();
        }
        if(responseData.containsKey('current_password')) {
          CurrentPasswordMsg= responseData['current_password'].toString();
        }
        if(responseData.containsKey('password')) {
          PasswordMsg= responseData['password'].toString();
        }
        return;
      }
      user!.name=EditedData.name;
      user!.photo=EditedData.photo;
      user!.newPassword=EditedData.newPassword;
      update();
      Dialogs.SuccessEdit("Updated Successfully!",null);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  // Future<void> uploadImage() async {
  //   // if (await Permission.storage.request().isGranted) {
  //
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['jpg', 'jpeg', 'png'],
  //   );
  //   if (result != null &&  ['jpg', 'jpeg', 'png'].contains(result.files.single.extension) ) {
  //     user!.photo = File(result.files.single.path!);
  //     update();
  //   }
  // }
  Future<void> upload(img,id) async {
    try {
      print('llllllllllllllllllllllllllllllllllll');


      final responseData = await Network.upload(img,user!.name,'${AuthNetwork.baseUrl}/profile/${id}');

      update();
      Dialogs.Success("Updated Successfully!");

    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again! < $e>");
    }

  }
}