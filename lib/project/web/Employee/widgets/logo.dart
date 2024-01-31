
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//--web-renderer html
class Logo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 30.w,
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
             child: Image.asset("images/pic22.png")
        ),
      ),
    );
  }
}


