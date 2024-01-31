import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/colors.dart';
import '../../Controller/Levels/LevelController.dart';

class dialogDetail extends StatelessWidget {
  int id;
  dialogDetail({required this.id});
LevelController controller =Get.find();
  @override
  Widget build(BuildContext context) {
    return
     Column(
       ////  mainAxisAlignment: MainAxisAlignment.spaceAround,
       crossAxisAlignment: CrossAxisAlignment.start,
       //  ,
       children: [
         SizedBox(
           height: 20,
         ),
         Text(
           'Level Name :',
           style: TextStyle(
               fontSize: 14,
               color: Colors.blue,
           fontWeight: FontWeight.bold),
         ),
         field(  controller.levels.values.elementAt(id).name!),
         Text(
           'AGE :',
           style: TextStyle(
               fontSize: 14,
               color: Colors.blue,
               fontWeight: FontWeight.bold),
         ),
      field(controller.levels.values.elementAt(id).age.toString())
       ],
    );
  }
}

Widget field( String val){
  return    Padding(
    padding:
    EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    child: Container(
      color: Color.fromARGB(255, 247, 244, 244),
      child: TextFormField(
        // textAlignVertical: TextAlignVertical.center,
        enabled: false,
        decoration: InputDecoration(
            prefixText: '     ',
            border: UnderlineInputBorder(),
            hintText: val,
            hintStyle: TextStyle(
                fontSize: 12,
                color: Colors.black,
              )),
      ),
    ),
  );
}