import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/authCard.dart';
import '../../widgets/logo.dart';

class Login extends StatelessWidget {
  static const routeName = '/Login';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:
        Column(
          children: [
            Expanded(
              child: Logo()
            ),
            Expanded(child: AuthCard())
          ],
        ),
        ),
    );
  }
}