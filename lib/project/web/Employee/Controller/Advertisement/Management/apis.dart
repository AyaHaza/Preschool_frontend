import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../Authentication/AuthController.dart';
import '../../../Model/chat_user.dart';
import '../../../Model/message.dart';
class APIs {

  static AuthController auth =Get.find();

  // for accessing cloud firestore database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // for accessing firebase storage
  static FirebaseStorage storage = FirebaseStorage.instance;

  // for accessing firebase messaging (Push Notification)
  static FirebaseMessaging fMessaging = FirebaseMessaging.instance;


  static ChatUser? me;

  static List<ChatUser> list = [];


  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {
    return firestore
        .collection('users')
        .where("id",whereIn: ["Management","school"])
        .snapshots();
  }

  // for getting current user info
  static Future<void> getSelfInfo() async {
    await firestore.collection('Management').doc(auth.user!.id.toString()).get().then((user) async {
      if (user.exists) {
        me = ChatUser.fromJson(user.data()!);
        await getFirebaseMessagingToken();
        //for setting user status to active
        await firestore.collection('Management').doc(me!.id).update({'push_token': me!.pushToken,});
        print('My Data: ${user.data()}');
      }
    });
  }


  // for getting all messages of a specific conversation from firestore database
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(
      ChatUser user) {
    return firestore
        .collection('chats/${user.id}/messages/')
        .orderBy('sent', descending: true)
        .snapshots();
  }

  static Future<void> sendMessage(
      ChatUser chatUser, String msg, Type type) async {

    //message sending time (also used as id)
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    //message to send
    final Message message = Message(
        toId: chatUser.id,
        msg: msg,
        type: type,
        fromId: me!.id,
        sent: time,
        fromName: "${me!.name}"
    );

    final ref = firestore
        .collection('chats/${chatUser.id}/messages/');
    await ref.doc(time).set(message.toJson()).then((value) => sendPushNotification(chatUser, type == Type.text ? msg : 'image'));
  }


  static Future<void> sendChatImage(ChatUser chatUser, Uint8List uploadfile ,String ext ) async {


    final ref = storage.ref().child('images/${chatUser.id}/${DateTime.now().millisecondsSinceEpoch}.$ext');

    //uploading image
    await ref
        .putData(uploadfile, SettableMetadata(contentType: 'image/$ext'))
        .then((p0) {
    });


    //updating image in firestore database
    final imageUrl = await ref.getDownloadURL();
    await sendMessage(chatUser, imageUrl, Type.image);
  }
  // for sending message


  // for getting firebase messaging token
  static Future<void> getFirebaseMessagingToken() async {
    await fMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    //

    await fMessaging.getToken(
      vapidKey: "BJHZnehFc1t-Agqn4Gki6llxm4KalvqEcXIWtvdhq56i4I1mWTQ5RuuSxrnvJ_ZJLE7SQ6Tow2IWfa_6s09cUhk",
    ).then((t){
      if (t != null) {
        me!.pushToken = t;
        print("Token   $t");
      }
    });

  }

  // static Future<void> updateProfilePicture(File file) async {
  //   //getting image file extension
  //   final ext = file.path.split('.').last;
  //   print('Extension: $ext');
  //
  //   //storage file ref with path
  //   final ref = storage.ref().child('profile_pictures/${me!.id}.$ext');
  //
  //   //uploading image
  //   await ref
  //       .putFile(file, SettableMetadata(contentType: 'image/$ext'))
  //       .then((p0) {
  //     print('Data Transferred: ${p0.bytesTransferred / 1000} kb');
  //   });
  //
  //   //updating image in firestore database
  //   me!.image = await ref.getDownloadURL();
  //   await firestore
  //       .collection('Students')
  //       .doc(me!.id)
  //       .update({'image': me!.image});
  // }


  static Future<void> sendPushNotification(
      ChatUser chatUser, String msg) async {


    if(chatUser.id=="school") {
      var students =await firestore.collection('Students').get();
      students.docs.forEach((element) async {

        ChatUser temp = ChatUser.fromJson(element.data()!);

        try {
          final body = {
            "to": temp.pushToken,
            "notification": {
              "title": me!.name, //our name should be send
              "body": msg,
              "android_channel_id": "chats"
            },
          };

          var res = await post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
              headers: {
                HttpHeaders.contentTypeHeader: 'application/json',
                HttpHeaders.authorizationHeader:
                'key=AAAAusXdILU:APA91bHRF32ZodeG8grA2Rw3te40i9vfO2IaTwf4X9WsdS6kiI7SI6j7GV0FZetbWl7qxAaSBoZX7_vMkSCtFjFtDvfp18DDH4I7swH3X9-5cgS86DYE8BJYBR_l3EXohGiMrcFltOU1'
              },
              body: jsonEncode(body))
          ;

        } catch (e) {
          print('\nsendPushNotificationE: $e');
        }

      });
    }

    else if (chatUser.id.contains("Management"));
    {

      var students =await firestore.collection('Teachers').get();
      students.docs.forEach((element) async {

        ChatUser temp = ChatUser.fromJson(element.data()!);
        try {
          final body = {
            "to": temp.pushToken,
            "notification": {
              "title": me!.name, //our name should be send
              "body": msg,
              "android_channel_id": "chats"
            },
          };

          var res = await post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
              headers: {
                HttpHeaders.contentTypeHeader: 'application/json',
                HttpHeaders.authorizationHeader:
                'key=AAAAusXdILU:APA91bHRF32ZodeG8grA2Rw3te40i9vfO2IaTwf4X9WsdS6kiI7SI6j7GV0FZetbWl7qxAaSBoZX7_vMkSCtFjFtDvfp18DDH4I7swH3X9-5cgS86DYE8BJYBR_l3EXohGiMrcFltOU1'
              },
              body: jsonEncode(body))
          ;

        } catch (e) {
          print('\nsendPushNotificationE: $e');
        }

      });
    }
  }


  /////////////////////////////////////////////////////


  static Future<void> StoreClass(int id,String name) async {

    //message sending time (also used as id)
Map<String,String> Class ={
  "id": "class $id",
  "image":"https://firebasestorage.googleapis.com/v0/b/my-project-66697.appspot.com/o/profile_pictures%2F3031685.png?alt=media&token=11ea33af-8c8b-4752-9bf7-6d7b2077e5dc&_gl=1*sszhv9*_ga*NDU2NTc3MjczLjE2ODE2Njk2MzQ.*_ga_CW55HF8NVT*MTY4NjA5NDA4Ny41NC4xLjE2ODYwOTc5ODguMC4wLjA.",
  "name":name
};

    final ref = firestore
        .collection('users');
    await ref.doc("class $id").set(Class);
  }

  static Future<void> DeleteClass(int id) async {

    final ref = firestore
        .collection('users');
   await ref.doc("class $id").delete();

  }

  static Future<void> StoreUser(String role,int id,String name) async {

    //message sending time (also used as id)
    if(role.compareTo("manager")==0){
      Map<String,String> User ={
        "id": id.toString(),
        "image":"https://firebasestorage.googleapis.com/v0/b/my-project-66697.appspot.com/o/profile_pictures%2F1.jpg?alt=media&token=10051d3d-4fd1-425d-990c-e6215e1f8b7b",
        "name":name,
        "push_token":""
      };
      final ref = firestore
          .collection('Management');
      await ref.doc(id.toString()).set(User);
    }
    else if (role.compareTo("Student")==0){
      Map<String,String> User ={
        "id": id.toString(),
        "image":"",
        "name":name,
        "push_token":""
      };
      final ref = firestore
          .collection('Students');
      await ref.doc(id.toString()).set(User);
    }else{
      Map<String,String> User ={
        "id": id.toString(),
        "image":"",
        "name":name,
        "push_token":""
      };
      final ref = firestore
          .collection('Teachers');
      await ref.doc(id.toString()).set(User);
    }
  }


  static Future<void> DeleteUser(String role,int id) async {
    if (role.compareTo("manager") == 0) {
      final ref = firestore
          .collection('Management');
      await ref.doc(id.toString()).delete();
    }
    else if (role.compareTo("Student") == 0) {
      final ref = firestore
          .collection('Students');
      await ref.doc(id.toString()).delete();
    } else {
      final ref = firestore
          .collection('Teachers');
      await ref.doc(id.toString()).delete();
    }
  }
}