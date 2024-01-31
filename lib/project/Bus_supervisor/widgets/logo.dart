
import 'package:flutter/cupertino.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Hero(
      tag: "1",
      child: Cube(
        onSceneCreated: (Scene scene) {
          scene.world.add(Object(fileName: 'images/model.obj'));
          scene.camera.zoom = 6.sp;
        },
      ),
    );
  }
}


