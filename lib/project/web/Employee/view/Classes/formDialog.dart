import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/colors.dart';
import '../../Controller/Clasees/classController.dart';
import '../../Controller/Levels/LevelController.dart';

class classdialogDetail extends StatelessWidget {
  int id;
  classdialogDetail({required this.id});
  LevelController controller1 =Get.find();
  ClassController controller =Get.find();

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
            'Class Name :',
            style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
                fontWeight: FontWeight.bold),
          ),
          field(  controller.Classes.values.elementAt(id).name!),
          Text(
            'Capacity :',
            style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
                fontWeight: FontWeight.bold),
          ),
          field(controller.Classes.values.elementAt(id).capacity.toString()),
          Text(
            'Level :',
            style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
                fontWeight: FontWeight.bold),
          ),
          field(controller1.levels[controller.Classes.values.elementAt(id).levelId]!.name!)
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