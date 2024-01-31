import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Model/chat_user.dart';
import '../../view/Advertisement/Advetisement.dart';
import '../../view/Advertisement/chat_screen.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUser user;

  const ChatUserCard({super.key, required this.user});
  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      // Get.toNamed( HomePage.routeName,arguments: [0]);
         Navigator.push(
             context,
             MaterialPageRoute(
                 builder: (_) => Advertisement(user: widget.user))
         );
    },
        child:   Row(
          children: [
            Text(widget.user.name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: 28.w,
                height: 30.h,
                child: Image.network(
                  widget.user.image,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Icon(Icons.person,color: Colors.cyan,);
                  },
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 4.w,)
          ],
        ),
    );
  }

}
