import 'dart:async';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../Model/chat_user.dart';
import '../../Model/message.dart';
import '../../Controller/Advertisement/apis.dart';
import '../../widgets/Advertisement/message_card.dart';
class ChatScreen extends StatefulWidget {
  final ChatUser user;

  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> _list = [];
 late Stream<QuerySnapshot<Map<String, dynamic>>> myStream;
  final _textController = TextEditingController();


  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      //exit full-screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarColor: Colors.white));
    });
  }

  @override
  Widget build(BuildContext context) {
    myStream =  APIs.getAllMessages(widget.user);

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
            child: WillPopScope(
              onWillPop: () {
                  return Future.value(true);
              },
              child: Scaffold(
                  //app bar
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    flexibleSpace: _appBar(),
                  ),
                  backgroundColor: const Color.fromARGB(255, 234, 248, 255),
                  body: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Expanded(
                      flex: 6,
                      child: StreamBuilder(
                         stream:myStream,
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                          //if data is loading
                            case ConnectionState.waiting:
                              return const Center(child: CircularProgressIndicator());
                            case ConnectionState.none:
                               return const SizedBox();

                          //if some or all data is loaded then show it
                            case ConnectionState.active:
                            case ConnectionState.done:
                               final data = snapshot.data?.docs;
                               _list = data
                                   ?.map((e) => Message.fromJson(e.data()))
                                   .toList() ??
                                   [];
                                return ListView.builder(
                                    reverse: true,
                                    itemCount: _list.length,
                                    padding: EdgeInsets.only(top: 1.h),
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return MessageCard(message: _list[index]);
                                      // return Text("Message:"+_list[index]);
                                    });

                          }
                        },
                      ),
                    ),

                  ])),
            )));
  }

  Widget _appBar() {
    return InkWell(
        child: Row(children: [
      //back button
      IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black54)),

      //user profile picture
      ClipRRect(
        borderRadius: BorderRadius.circular(25.h),
        child: CachedNetworkImage(
          width: 25.h,
          height: 25.h,
          imageUrl: widget.user.image,
          errorWidget: (context, url, error) =>
              const CircleAvatar(child: Icon(Icons.person)),
        ),
      ),

      //for adding some space
      const SizedBox(width: 10),
      ////***********************************
      //    child: StreamBuilder(
      //             stream: APIs.getUserInfo(widget.user),
      //user name & last seen time
      Text(widget.user.name,
          style: const TextStyle(
            fontSize: 17,
          ))
    ]));
  }

  // bottom chat input field
  @override
  void dispose() {
    myStream.drain() ;// myStream.cancel(); //Cancel your subscription here.
    super.dispose();
  }
}
