import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Template.dart';
import 'ProfileEditCard.dart';

class ProfileEditPage extends StatelessWidget {
  static const routeName = '/Profile';

  @override
  Widget build(BuildContext context) {
    return Template(
      text: 'Profile ', Content: ProfileEdit()
    );
  }
}
