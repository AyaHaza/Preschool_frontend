import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../CONSTANT/size_config.dart';
import '../../../Controller/StudentFee/FeeController.dart';
import '../../../Model/StudentsFee.dart';
import '../../../widgets/ElevatedButton.dart';
import '../studentFee/Table.dart';
import 'Table.dart';


class pagecontent extends StatelessWidget {
  FeeController controller =Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: SizeConfig.screenWidth,
            child:  Wrap(
              spacing: 2.w,
              runSpacing: 20,
              alignment: WrapAlignment.start,
              children: [
                ButtonElevated( text: 'All', icon:Icons.clear_all_rounded, function:(){controller.set(controller.ALLStudentFee);},color: Colors.blue,  ),
                ButtonElevated(text: 'Paid Students', icon: Icons.paid, function:(){controller.set(controller.PaidStudentFee);},color: Colors.yellow,  ),
                ButtonElevated(  text: 'Complete Paid Students', icon: Icons.check_circle_outline_outlined, function: (){controller.set(controller.CompleteStudentFee);},color: Colors.teal, ),
                ButtonElevated( text: 'Late Paid Students',icon: Icons.warning, function: (){controller.set(controller.LateStudentFee);},color: Colors.red,),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 4, ),
          StudentsContent()
        ],
      ),
    );
  }
}
