import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../Model/chat_user.dart';
import '../../Model/message.dart';
import '../Authentication/AuthController.dart';
import 'Teacher/Classes.dart';


class APIs {

  static AuthController auth =Get.find();
  static TeacherClassController teacherclass =Get.find();



  // for accessing cloud firestore database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // for accessing firebase storage
  static FirebaseStorage storage = FirebaseStorage.instance;

  // for accessing firebase messaging (Push Notification)
  static FirebaseMessaging fMessaging = FirebaseMessaging.instance;

  static List<ChatUser> list = [];

  static ChatUser? me;

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {
    List<String> users=[];
    teacherclass.Teacherclass!.forEach((key, value) {
      users.add("class ${key.toString()}");
    });    users.addAll(["school","Management"]);
    return firestore
        .collection('users')
        .where("id",whereIn: users)
        .snapshots();
  }


  // for getting current user info

  static Future<void> getSelfInfo() async {
    await firestore.collection('Teachers').doc(auth.user!.id.toString()).get().then((user) async {
      if (user.exists) {
        me = ChatUser.fromJson(user.data()!);
        await getFirebaseMessagingToken();
        //for setting user status to active
        await firestore.collection('Teachers').doc(me!.id).update({'push_token': me!.pushToken,});
        print('My Data: ${user.data()}');
      }
    });
  }

  static Future<void> updateProfilePicture(File file) async {
    //getting image file extension
    final ext = file.path.split('.').last;
    print('Extension: $ext');

    //storage file ref with path
    final ref = storage.ref().child('profile_pictures/Teachers/${me!.id}.$ext');

    //uploading image
    await ref
        .putFile(file, SettableMetadata(contentType: 'image/$ext'))
        .then((p0) {
      print('Data Transferred: ${p0.bytesTransferred / 1000} kb');
    });

    //updating image in firestore database
    me!.image = await ref.getDownloadURL();
    await firestore
        .collection('Teachers')
        .doc(me!.id)
        .update({'image': me!.image});
  }

  // for getting all messages of a specific conversation from firestore database



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


  static Future<void> sendChatImage(ChatUser chatUser, File file) async {
    //getting image file extension
    final ext = file.path.split('.').last;

    //storage file ref with path
    final ref = storage.ref().child('images/${chatUser.id}/${DateTime.now().millisecondsSinceEpoch}.$ext');

    //uploading image
    await ref
        .putFile(file, SettableMetadata(contentType: 'image/$ext'))
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
    await fMessaging.getToken().then((t) {
      if (t != null) {
        me!.pushToken = t;
        print("push token   "+me!.pushToken);
      }
    });

  }


  static Future<void> sendPushNotification(
      ChatUser chatUser, String msg) async {
//get class id
    var s=chatUser.id;
    var r=s.replaceAll(new RegExp(r'[^0-9]'),'').trim();
    if(teacherclass.teacher_classes_students.containsKey(r)) {
      //foreach student
      teacherclass.teacher_classes_students[r]!.forEach((element) async {

        await firestore.collection('Students').doc(element.id.toString()).get().then((user) async {
          if (user.exists) {
            ChatUser temp = ChatUser.fromJson(user.data()!);

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
          }
        });
      });
    }
  }

}