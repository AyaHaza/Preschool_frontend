import 'package:flutter/material.dart';
import '/CONSTANT/colors.dart';
import '/CONSTANT/responsive.dart';
import '/CONSTANT/size_config.dart';
import 'StyleText.dart';

class InfoCard extends StatelessWidget {
  final IconData? icon;
  final String label;
  final String? amount;
  final Color? color;

  InfoCard({this.icon, required this.label, this.amount, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints( minWidth: Responsive.isDesktop(context) ? 200 : SizeConfig.screenWidth! / 2 - 100),
      padding: EdgeInsets.only(top: 20 , bottom: 20 , left: 20 , right: Responsive.isMobile(context) ? 20 : 40),
      decoration: BoxDecoration(
        boxShadow: const <BoxShadow>[BoxShadow( color: AppColors.shadwo, blurRadius: 5.0, offset: Offset(0.0, 0.75))],
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon( icon, color: AppColors.iconGray,),
          SizedBox( height: SizeConfig.blockSizeVertical! * 2,),
          StyleText(text: label, color: AppColors.iconGray, size: 16),
          SizedBox( height: SizeConfig.blockSizeVertical! * 2, ),
        ],
      ),
    );
  }
}
