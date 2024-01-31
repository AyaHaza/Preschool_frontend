import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../Controller/Advertisement/apis.dart';
import '../../../Model/chat_user.dart';
import '../../../widgets/Advertisement/chat_user_card.dart';
import '../../../widgets/AppBar.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ChatUser> list = [];
  // for storing searched items
  final List<ChatUser> searchList = [];
  late Stream<QuerySnapshot<Map<String, dynamic>>> myStream;

  // for storing search status
  bool isSearching = false;
  @override
  void initState()  {
    APIs.getSelfInfo();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {



    return   GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: WillPopScope(
          onWillPop: () {
            if (isSearching) {
              setState(() {
                isSearching = !isSearching;
              });
              return Future.value(false);
            } else {
              return Future.value(true);
            }
          },
          child: Scaffold(
              drawer: AppDrawer(),
              appBar: AppBar(
                title: isSearching
                    ? TextField(
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Name'),
                  autofocus: true,
                  style: const TextStyle(fontSize: 17, letterSpacing: 0.5),
                  //when search text changes then updated search list
                  onChanged: (val) {
                    searchList.clear();
                    for (var i in list) {
                      if (i.name.toLowerCase().contains(val.toLowerCase())) {
                        searchList.add(i);
                        setState(() {
                          searchList;
                        });
                      }
                    }
                  },
                )
                    : const Text('Advertisement'),
                actions: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isSearching = !isSearching;
                        });
                      },
                      icon: Icon(isSearching
                          ? Icons.clear
                          : Icons.search)
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProfileScreen(user:APIs.me!)));
                      },
                      icon: Icon(Icons.mode_edit_outline_outlined)
                  )
                ],
              ),

              body: FutureBuilder(
                future:    APIs.getSelfInfo(),
                  builder: (ctx, authResultSnapshot) =>
                authResultSnapshot.connectionState ==
                    ConnectionState.waiting
                ?Center(child: CircularProgressIndicator()):
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
                          itemCount: isSearching
                              ? searchList.length
                              : list.length,
                          padding: EdgeInsets.only(top: 3),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ChatUserCard(
                                user: isSearching
                                    ? searchList[index]
                                    : list[index]
                            );
                          },
                        );
                    }}

                )
              )),
        ),

    );
  }
  @override
  void dispose() {
    // myStream.drain() ;// myStream.cancel(); //Cancel your subscription here.
    super.dispose();
  }
}
