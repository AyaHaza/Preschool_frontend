
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Model/chat_user.dart';
import '../Template.dart';
import 'chat_screen.dart';

class Advertisement extends StatelessWidget {
  const Advertisement({required this.user});
  static var routeName = '/Advertisement';
  final ChatUser user;
  @override
  Widget build(BuildContext context) {
    return Template(text: 'Advertisement', Content: ChatScreen(user:user),);
  }
}
