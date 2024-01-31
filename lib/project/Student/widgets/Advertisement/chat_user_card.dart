import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Model/chat_user.dart';
import '../../view/Advertisement/chat_screen.dart' as nosend;
class ChatUserCard extends StatefulWidget {
  final ChatUser user;

  const ChatUserCard({super.key, required this.user});
  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
    // color: Colors.blue.shade100,
    elevation: 0.5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child:InkWell(onTap: () {
         Navigator.push(
             context,
             MaterialPageRoute(
                 builder: (_) => nosend.ChatScreen(user: widget.user)));
    },
        child: ListTile(
          leading:
             ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                width: 30.h,
                height: 30.h,
                imageUrl: widget.user.image,
                errorWidget: (context, url, error) => const CircleAvatar(
                    child: Icon(Icons.person)),
              ),
            ),


            // CachedNetworkImage(
            //   width:50,
            //   height: 60,
            //   // imageUrl: widget.user.image,
            //   imageUrl:'https://picsum.photos/250?image=9' ,
            //   errorWidget: (context, url, error) => const CircleAvatar(
            //       child: Icon(Icons.person)),
            // ),
          // ),
          title: Text(widget.user.name),
          subtitle: Text(""),
          // trailing:
        )
    ),
    );
  }

}
