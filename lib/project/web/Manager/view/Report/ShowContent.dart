import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../CONSTANT/size_config.dart';
import '../../Controller/Report/Report.dart';
import '../../widgets/ElevatedButton.dart';
import 'Table.dart';


class pagecontent extends StatelessWidget {
  ReportController controller =Get.find();

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
                ButtonElevated( text: 'All Report', icon:Icons.clear_all_rounded, function:(){controller.set(controller.AFiles);},color: Colors.blue,  ),
                ButtonElevated(text: 'Monthly Report', icon: Icons.calendar_month, function:(){controller.set(controller.MFiles);},color: Colors.yellow,  ),
                ButtonElevated(  text: 'Year Report', icon: Icons.cached_sharp, function: (){controller.set(controller.YFiles);},color: Colors.teal, ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 4, ),
          Content()
        ],
      ),
    );
  }
}
