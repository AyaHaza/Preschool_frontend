import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../Model/User.dart';
import '../../Service/Authentication/AuthNetwork.dart';
import '../../Service/NetWork.dart';
import '../../view/Home/HomePage.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';
class AuthController extends GetxController{
  User? user=User(id:29,token: "133|S0pIUU1v0AJLnCqoNPqk3jQVIfWzk2GFR7ljatcv");
  bool isAuth =false;
  static const authEndpoint = "${AuthNetwork.baseUrl}/profile";
  static const Endpoint = "${AuthNetwork.baseUrl}/web/profile";

  String nameMsg="";
  String photoMsg="";
  String PasswordMsg="";
  String CurrentPasswordMsg="";

  @override
  void onInit() async{
    await tryAutoLogin();
    super.onInit();
    await Fetch();

  }


  Future<String?> login(String? password, String? name) async {
    try {
      final responseData = await AuthNetwork.Login(password, name);
      User user = User.fromJson(responseData['data']);
      user.token = responseData['access_token'];
      AuthNetwork.StoreData(user.token!, user.id!);
      isAuth=true;
      update();
    } on DioError catch (e) {
      print(e);
      throw e;    }
    catch (e) {
      print(e);
      throw e;}
  }



  Future<void> tryAutoLogin() async {
    MapEntry? data= await AuthNetwork.getData();
    if(data==null){
      print("nullllllllllllllll");

      isAuth=false;
      update();
    }else {
      isAuth = true;
      user = User(id: data!.key, token: data!.value);
      print("helllllllllllllllllllo");
      print(user!.token);
      update();
    }
  }


  Future<void> logout() async {
    try {
      if(user!=null) {
        await AuthNetwork.logout(user!.token);
      }
      user=null;
      isAuth=false;
      update();
    } on DioError catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
    catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
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
    EditedData.photo=user!.photo;
    try {
      final responseData = await Network.Store(EditedData,"$Endpoint/${EditedData.id}");

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
      user!.newPassword=EditedData.newPassword;
      update();
      Dialogs.SuccessEdit("Updated Successfully!",HomePage.routeName);
    }  catch (e) {
      print(e);
      Dialogs.Error("ERROR occure ! please Try Again!  <$e>");
    }
  }
  Future<String?> uploadImage() async {
    String? imageurl;

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null &&
        ['jpg', 'jpeg', 'png'].contains(result.files.single.extension)) {

      Uint8List uploadfile =result.files.single.bytes!;
      String extention =result.files.single.extension!;

      FirebaseStorage storage = FirebaseStorage.instance;


      //storage file ref with path
      final ref = storage.ref().child('/Web_profile_pictures/${user!.id}_${DateTime.now().millisecondsSinceEpoch}.$extention');

      //uploading image
      await ref
          .putData(uploadfile, SettableMetadata(contentType: 'image/$extention'))
          .then((p0) {
      });

      //updating image in firestore database
      imageurl = await ref.getDownloadURL().then((value) {

        print("Dddddddddddddddddddddddddddddddd");
        user!.photo=value;
        print(user!.photo);
        print(imageurl);
        update();


      });



      //
      //
      // Reference storage = FirebaseStorage.instance.ref().child("/Web_profile_pictures/${user!.id}_${DateTime.now().millisecondsSinceEpoch}.$extention");
      //
      // final UploadTask uploadTask = storage.putData(uploadfile);
      // uploadTask.whenComplete(() async{
      //   imageurl = await uploadTask.snapshot.ref.getDownloadURL().then((value) {
      //     print("Dddddddddddddddddddddddddddddddd");
      //     user!.photo=imageurl;
      //     print(user!.photo);
      //     print(imageurl);
      //     update();
      //   });
      // });
      return imageurl;
    } else {
      // User canceled the picker
    }
  }

}