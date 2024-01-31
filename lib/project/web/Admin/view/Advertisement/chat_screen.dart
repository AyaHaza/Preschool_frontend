
import 'package:file_picker/file_picker.dart';

import '../../Controller/Advertisement/Management/apis.dart';
import '../../Model/chat_user.dart';
import '../../Model/message.dart';
import '../../widgets/Advertisement/message_card.dart';
import 'dart:async';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:image_picker/image_picker.dart';

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

  bool _showEmoji = false, _isUploading = false;

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
    myStream = APIs.getAllMessages(widget.user);

    return Container(
      color: Colors.teal.withOpacity(0.1),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: WillPopScope(
            onWillPop: () {
              if (_showEmoji) {
                setState(() => _showEmoji = !_showEmoji);
                return Future.value(false);
              } else {
                return Future.value(true);
              }
            },
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _appBar(),
                  Expanded(
                    flex: 6,
                    child: StreamBuilder(
                      stream: myStream,
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                        //if data is loading
                          case ConnectionState.waiting:
                            return const Center(
                                child: CircularProgressIndicator());
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
                            if (_list.isNotEmpty) {
                              return ListView.builder(
                                  reverse: true,
                                  itemCount: _list.length,
                                  padding: EdgeInsets.only(top: 1.h),
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return MessageCard(message: _list[index]);
                                    // return Text("Message:"+_list[index]);
                                  });
                            } else {
                              return const Center(
                                child: Text('Say Hii! 👋',
                                    style: TextStyle(fontSize: 20)),
                              );
                            }
                        }
                      },
                    ),
                  ),
                  if (_isUploading)
                    const Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            child: CircularProgressIndicator(strokeWidth: 2))),
                  Expanded(
                    child: _chatInput(),
                  ),
                  (_showEmoji)
                      ? SizedBox(
                    height: 195.h,
                    child: EmojiPicker(
                      textEditingController: _textController,
                      config: const Config(
                        bgColor: Color.fromARGB(255, 234, 248, 255),
                        columns: 8,
                        emojiSizeMax: 32 * 1.0,
                      ),
                    ),
                  )
                      : Container()
                ])),
      ),
    );
  }

  Widget _appBar() {
    return InkWell(
        child: Container(
          color: Colors.black.withOpacity(0.1),
          child: Row(children: [
            //back button
            SizedBox(
              width: 20.w,
              height: 40.h,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.black54)),
            ),

            //user profile picture
            ClipRRect(
              borderRadius: BorderRadius.circular(50.w),
              child: CachedNetworkImage(
                width: 50.w,
                height: 50.h,
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
          ]),
        ));
  }

  // bottom chat input field
  Widget _chatInput() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 5.h),
      child: Row(
        children: [
          //input field & buttons
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //emoji button
                  IconButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        setState(() => _showEmoji = !_showEmoji);
                      },
                      icon: const Icon(Icons.emoji_emotions,
                          color: Colors.black45, size: 25)),
                  Expanded(
                      child: TextField(
                        controller: _textController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        onTap: () {
                          if (_showEmoji) setState(() => _showEmoji = !_showEmoji);
                        },
                        decoration: const InputDecoration(
                            hintText: 'Type Something...',
                            hintStyle: TextStyle(color: Colors.black45),
                            border: InputBorder.none),
                      )),

                  //pick image from gallery button
                  IconButton(
                      onPressed: () async {
                        FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                          allowMultiple: true,
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'jpeg', 'png'],
                        );

                        if (result != null) {
                          result.files.forEach((element) async {
                            setState(() => _isUploading = true);
                            await APIs.sendChatImage(widget.user,
                                element.bytes!, element.extension!);
                            setState(() => _isUploading = false);
                          });
                        }
                      },
                      icon: const Icon(Icons.image,
                          color: Colors.black45, size: 26)),

                  //take image from camera button
                  //adding some space
                  SizedBox(width: 10.w),
                ],
              ),
            ),
          ),

          //send message button
          MaterialButton(
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                //simply send message
                APIs.sendMessage(widget.user, _textController.text, Type.text);
                _textController.text = '';
              }
            },
            minWidth: 0,
            padding:
            const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 10),
            shape: const CircleBorder(),
            color: Colors.blue,
            child: const Icon(Icons.send, color: Colors.white, size: 30),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    myStream.drain(); // myStream.cancel(); //Cancel your subscription here.
    super.dispose();
  }
}
