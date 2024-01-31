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


class APIs {

  static AuthController auth =Get.find();



  // for accessing cloud firestore database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // for accessing firebase storage
  static FirebaseStorage storage = FirebaseStorage.instance;

  // for accessing firebase messaging (Push Notification)
  static FirebaseMessaging fMessaging = FirebaseMessaging.instance;

  static ChatUser? me;


  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {

    return firestore
        .collection('users')
        .where("id",whereIn: [ "Class ${auth.user!.class_id.toString()}","class ${auth.user!.class_id.toString()}","school"])
        .snapshots();
  }


  // for getting current user info
  static Future<void> getSelfInfo() async {
    await firestore.collection('Students').doc(auth.user!.id.toString()).get().then((user) async {
      if (user.exists) {
        me = ChatUser.fromJson(user.data()!);
        await getFirebaseMessagingToken();
        //for setting user status to active
        await firestore.collection('Students').doc(me!.id).update({'push_token': me!.pushToken,});
        print('My Data: ${user.data()}');
      }
    });
  }

  static Future<void> updateProfilePicture(File file) async {
    //getting image file extension
    final ext = file.path.split('.').last;
    print('Extension: $ext');

    //storage file ref with path
    final ref = storage.ref().child('profile_pictures/Students/${me!.id}.$ext');

    //uploading image
    await ref
        .putFile(file, SettableMetadata(contentType: 'image/$ext'))
        .then((p0) {
      print('Data Transferred: ${p0.bytesTransferred / 1000} kb');
    });

    //updating image in firestore database
    me!.image = await ref.getDownloadURL();
    await firestore
        .collection('Students')
        .doc(me!.id)
        .update({'image': me!.image});
  }




  // for getting all messages of a specific conversation from firestore database
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(
      ChatUser user) {
    return firestore
        .collection('chats/${user.id}/messages/')
        .orderBy('sent', descending: true)
        .snapshots();
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
        print("push token   " + me!.pushToken);
      }
    });
  }


}