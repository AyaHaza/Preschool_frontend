import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Controller/Advertisement/Management/apis.dart';
import '../../Model/chat_user.dart';
import 'chat_user_card.dart';


Widget chats(){
  List<ChatUser> list = [];
  // for storing searched items
  late Stream<QuerySnapshot<Map<String, dynamic>>> myStream;

  return FutureBuilder(
      future:APIs.getSelfInfo(),
      builder: (ctx, authResultSnapshot) =>
      authResultSnapshot.connectionState ==
          ConnectionState.waiting
          ?const Center(child: CircularProgressIndicator()):
      StreamBuilder(
          stream:APIs.getAllUsers(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
            //if data is loading
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.none:
                return const Center(child: CircularProgressIndicator());
            //if some or all data is loaded then show it
              case ConnectionState.active:

              case ConnectionState.done:
                final data = snapshot.data?.docs;
                list = data?.map((e) => ChatUser.fromJson(e.data())).toList() ?? [];
                APIs.list =list;

                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChatUserCard(
                        user: list[index]
                    );
                  },
                );
            }}

      )
  );
}