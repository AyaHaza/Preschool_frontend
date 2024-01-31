
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../CONSTANT/colors.dart';


class ColorDropDown extends StatefulWidget {
  String ?label;

  late double height=50;
  late double width=170;

  // ColorDropDown({
  //   Key? key,
  //   this.onChanged,
  //   this.height = 25,
  //   this.width = 150,
  //   this.label,
  // }) : super(key: key);

  @override
  _ColorDropDownState createState() => _ColorDropDownState();
}

class _ColorDropDownState extends State<ColorDropDown> {
  Color ?value;
  Color ?value1;
  Color ?value2;
  Color ?value3;
  Color ?value4;
  final List<Color> colors = [
    Color(0xffF95754).withOpacity(1.0),
    Colors.blue,
    Colors.green,
    Color(0xffFCB23C).withOpacity(1.0),
    Color(0xff704B10).withOpacity(1.0),
    Color(0xffB376DD).withOpacity(1.0),
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: 500,height: 70,
            child: Row(children: [
              Container(
                width: 70,
                height: 70,
                child:
                DropdownButtonFormField2<Color>(

                  isExpanded: true,
                  //  barrierColor: Colors.white,
                  value: value,

                  onChanged: (color) {
                    setState(() => value = color);
                    print(value);
                    // RPSCustomPainter( err: value);
                  },
                  customButton:  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: CustomPaint(
                          size: Size(60, 60),
                          painter: ddd( err:(value==null)?Colors.white:value),
                        ),
                      ),
                    ),
                  ),


                  //  isExpanded: true,
                  items: colors
                      .map(
                        (e) => DropdownMenuItem(
                        alignment: Alignment.center,
                        value: e,
                        child:  CircleAvatar(backgroundColor: e,)
                      //  SvgPicture.asset('assets/ted.svg',height: 500,
                      //    width: 200,
                      //    colorFilter: ColorFilter.mode(e,  BlendMode.srcIn),
                      //  //  fit: BoxFit.fill,
                      // //   color: e,
                      //  )

                    ),
                  )
                      .toList(),
                ),

              ),
              Container(
                width: 70,
                height: 70,
                child:
                DropdownButtonFormField2<Color>(

                  isExpanded: true,
                  //  barrierColor: Colors.white,
                  value: value4,

                  onChanged: (color) {
                    setState(() => value4 = color);
                    print(value4);
                    // RPSCustomPainter( err: value);
                  },
                  customButton:  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CustomPaint(
                          size: Size(80, 80),
                          painter: five( fiv:(value4==null)?Colors.white:value4),
                        ),
                      ),
                    ),
                  ),


                  //  isExpanded: true,
                  items: colors
                      .map(
                        (e) => DropdownMenuItem(
                        alignment: Alignment.center,
                        value: e,
                        child:  CircleAvatar(backgroundColor: e,)
                      //  SvgPicture.asset('assets/ted.svg',height: 500,
                      //    width: 200,
                      //    colorFilter: ColorFilter.mode(e,  BlendMode.srcIn),
                      //  //  fit: BoxFit.fill,
                      // //   color: e,
                      //  )

                    ),
                  )
                      .toList(),
                ),

              ),

              Container(
                width: 70,
                height: 70,
                child:
                DropdownButtonFormField2<Color>(

                  isExpanded: true,
                  //  barrierColor: Colors.white,
                  value: value1,

                  onChanged: (color) {
                    setState(() => value1 = color);
                    print(value1);
                    // RPSCustomPainter( err: value);
                  },
                  customButton:  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: CustomPaint(
                          size: Size(80, 80),
                          painter: two( tw:(value1==null)?Colors.white:value1),
                        ),
                      ),
                    ),
                  ),


                  //  isExpanded: true,
                  items: colors
                      .map(
                        (e) => DropdownMenuItem(
                        alignment: Alignment.center,
                        value: e,
                        child:  CircleAvatar(backgroundColor: e,)
                      //  SvgPicture.asset('assets/ted.svg',height: 500,
                      //    width: 200,
                      //    colorFilter: ColorFilter.mode(e,  BlendMode.srcIn),
                      //  //  fit: BoxFit.fill,
                      // //   color: e,
                      //  )

                    ),
                  )
                      .toList(),
                ),

              ),
              Container(
                width: 70,
                height: 70,
                child:
                DropdownButtonFormField2<Color>(

                  isExpanded: true,
                  //  barrierColor: Colors.white,
                  value: value2,

                  onChanged: (color) {
                    setState(() => value2 = color);
                    print(value1);
                    // RPSCustomPainter( err: value);
                  },
                  customButton:  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: CustomPaint(
                          size: Size(80, 80),
                          painter: three( thr:(value2==null)?Colors.white:value2),
                        ),
                      ),
                    ),
                  ),


                  //  isExpanded: true,
                  items: colors
                      .map(
                        (e) => DropdownMenuItem(
                        alignment: Alignment.center,
                        value: e,
                        child:  CircleAvatar(backgroundColor: e,)
                      //  SvgPicture.asset('assets/ted.svg',height: 500,
                      //    width: 200,
                      //    colorFilter: ColorFilter.mode(e,  BlendMode.srcIn),
                      //  //  fit: BoxFit.fill,
                      // //   color: e,
                      //  )

                    ),
                  )
                      .toList(),
                ),

              ),
              Container(
                width: 70,
                height: 70,
                child:
                DropdownButtonFormField2<Color>(

                  isExpanded: true,
                  //  barrierColor: Colors.white,
                  value: value3,

                  onChanged: (color) {
                    setState(() => value3 = color);
                    print(value3);
                    // RPSCustomPainter( err: value);
                  },
                  customButton:  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: CustomPaint(
                          size: Size(80, 80),
                          painter: three( thr:(value3==null)?Colors.white:value3),
                        ),
                      ),
                    ),
                  ),


                  //  isExpanded: true,
                  items: colors
                      .map(
                        (e) => DropdownMenuItem(
                        alignment: Alignment.center,
                        value: e,
                        child:  CircleAvatar(backgroundColor: e,)
                      //  SvgPicture.asset('assets/ted.svg',height: 500,
                      //    width: 200,
                      //    colorFilter: ColorFilter.mode(e,  BlendMode.srcIn),
                      //  //  fit: BoxFit.fill,
                      // //   color: e,
                      //  )

                    ),
                  )
                      .toList(),
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                  //  boxShadow: const [AppColors.shadowWidget],
                    border: Border.all(color:Color(0xff132C47).withOpacity(1.0), width: 2.0, style: BorderStyle.solid),
                    color: AppColors.barBg,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SvgPicture.asset('images/cupcake-svgrepo-com.svg',height: 50,
                    width: 50,
                    alignment: Alignment.bottomRight,
                    //  colorFilter: ColorFilter.mode(e,  BlendMode.srcIn),
                    //  fit: BoxFit.fill,
                    //   color: e,
                  ),
                ),
              )

            ],),
          ),
          SizedBox(height: 100,),
          CustomPaint(
            size: Size(400, 400),
            painter: RPSCustomPainter(
              tw:(value1==null)?Colors.white:value1,
              err:(value==null)?Colors.white:value,
              thr:(value2==null)?Colors.white:value2,
              fou:(value3==null)?Colors.white:value3,
              fiv:(value4==null)?Colors.white:value4,
            ),
          ),

          //Add this CustomPaint widget to the Widget Tree


          //Add this CustomPaint widget to the Widget Tree


          //Add this CustomPaint widget to the Widget Tree


          //Copy this CustomPainter code to the Bottom of the File


          //Copy this CustomPainter code to the Bottom of the File



        ],
      ),
    );

  }


}

class ddd extends CustomPainter{



  Color ?err;
  ddd({ required this.err});
  @override
  void paint(Canvas canvas, Size size) {


    Path path_1 = Path();
    path_1.moveTo(size.width*0.8166667,size.height*0.6333333);
    path_1.lineTo(size.width*0.7748333,size.height*0.9261667);
    path_1.cubicTo(size.width*0.7701667,size.height*0.9590000,size.width*0.7420000,size.height*0.9833333,size.width*0.7088333,size.height*0.9833333);
    path_1.lineTo(size.width*0.2911667,size.height*0.9833333);
    path_1.cubicTo(size.width*0.2580000,size.height*0.9833333,size.width*0.2298333,size.height*0.9590000,size.width*0.2251667,size.height*0.9261667);
    path_1.lineTo(size.width*0.1833333,size.height*0.6333333);
    path_1.lineTo(size.width*0.8166667,size.height*0.6333333);
    path_1.close();

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = err!;//قاعدة
    canvas.drawPath(path_1,paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }}
// Add this CustomPaint widget to the Widget Tree

class two extends CustomPainter{
  Color ?tw;
  two({ required this.tw});
  @override
  void paint(Canvas canvas, Size size) {

    Path path_2 = Path();
    path_2.moveTo(size.width*0.8500000,size.height*0.5500000);
    path_2.lineTo(size.width*0.8500000,size.height*0.6333333);
    path_2.lineTo(size.width*0.1500000,size.height*0.6333333);
    path_2.lineTo(size.width*0.1500000,size.height*0.5500000);
    path_2.cubicTo(size.width*0.1500000,size.height*0.5131667,size.width*0.1798333,size.height*0.4833333,size.width*0.2166667,size.height*0.4833333);
    path_2.lineTo(size.width*0.7833333,size.height*0.4833333);
    path_2.cubicTo(size.width*0.8201667,size.height*0.4833333,size.width*0.8500000,size.height*0.5131667,size.width*0.8500000,size.height*0.5500000);
    path_2.close();




    ///2
    Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    paint_2_fill.color = tw!;
    canvas.drawPath(path_2,paint_2_fill);
    Path path_3 = Path();
    path_3.moveTo(size.width*0.7833333,size.height*0.4833333);
    path_3.lineTo(size.width*0.2166667,size.height*0.4833333);
    path_3.cubicTo(size.width*0.1798333,size.height*0.4833333,size.width*0.1500000,size.height*0.5131667,size.width*0.1500000,size.height*0.5500000);
    path_3.lineTo(size.width*0.1500000,size.height*0.6000000);
    path_3.cubicTo(size.width*0.1500000,size.height*0.5631667,size.width*0.1798333,size.height*0.5333333,size.width*0.2166667,size.height*0.5333333);
    path_3.lineTo(size.width*0.7833333,size.height*0.5333333);
    path_3.cubicTo(size.width*0.8201667,size.height*0.5333333,size.width*0.8500000,size.height*0.5631667,size.width*0.8500000,size.height*0.6000000);
    path_3.lineTo(size.width*0.8500000,size.height*0.5500000);
    path_3.cubicTo(size.width*0.8500000,size.height*0.5131667,size.width*0.8201667,size.height*0.4833333,size.width*0.7833333,size.height*0.4833333);
    path_3.close();

    Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
    paint_3_fill.color = tw!;
    canvas.drawPath(path_3,paint_3_fill);
  }@override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }}
//Copy this CustomPainter code to the Bottom of the File

class three extends CustomPainter{

  Color ?thr;
  three({ required this.thr});
  @override
  void paint(Canvas canvas, Size size) {

    Path path_4 = Path();
    path_4.moveTo(size.width*0.8000000,size.height*0.4000000);
    path_4.lineTo(size.width*0.8000000,size.height*0.4833333);
    path_4.lineTo(size.width*0.2000000,size.height*0.4833333);
    path_4.lineTo(size.width*0.2000000,size.height*0.4000000);
    path_4.cubicTo(size.width*0.2000000,size.height*0.3631667,size.width*0.2298333,size.height*0.3333333,size.width*0.2666667,size.height*0.3333333);
    path_4.lineTo(size.width*0.7333333,size.height*0.3333333);
    path_4.cubicTo(size.width*0.7701667,size.height*0.3333333,size.width*0.8000000,size.height*0.3631667,size.width*0.8000000,size.height*0.4000000);
    path_4.close();

    Paint paint_4_fill = Paint()..style=PaintingStyle.fill;
    paint_4_fill.color = thr!;
    canvas.drawPath(path_4,paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(size.width*0.7333333,size.height*0.3333333);
    path_5.lineTo(size.width*0.2666667,size.height*0.3333333);
    path_5.cubicTo(size.width*0.2298333,size.height*0.3333333,size.width*0.2000000,size.height*0.3631667,size.width*0.2000000,size.height*0.4000000);
    path_5.lineTo(size.width*0.2000000,size.height*0.4500000);
    path_5.cubicTo(size.width*0.2000000,size.height*0.4131667,size.width*0.2298333,size.height*0.3833333,size.width*0.2666667,size.height*0.3833333);
    path_5.lineTo(size.width*0.7333333,size.height*0.3833333);
    path_5.cubicTo(size.width*0.7701667,size.height*0.3833333,size.width*0.8000000,size.height*0.4131667,size.width*0.8000000,size.height*0.4500000);
    path_5.lineTo(size.width*0.8000000,size.height*0.4000000);
    path_5.cubicTo(size.width*0.8000000,size.height*0.3631667,size.width*0.7701667,size.height*0.3333333,size.width*0.7333333,size.height*0.3333333);
    path_5.close();

    Paint paint_5_fill = Paint()..style=PaintingStyle.fill;
    paint_5_fill.color = thr!;
    canvas.drawPath(path_5,paint_5_fill);
  }@override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }}

class four extends CustomPainter{
  Color ?fou;
  four({ required this.fou});
  @override
  void paint(Canvas canvas, Size size) {
    Path path_6 = Path();
    path_6.moveTo(size.width*0.7333333,size.height*0.2833333);
    path_6.lineTo(size.width*0.7333333,size.height*0.3333333);
    path_6.lineTo(size.width*0.2666667,size.height*0.3333333);
    path_6.lineTo(size.width*0.2666667,size.height*0.2833333);
    path_6.cubicTo(size.width*0.2666667,size.height*0.2281667,size.width*0.3115000,size.height*0.1833333,size.width*0.3666667,size.height*0.1833333);
    path_6.lineTo(size.width*0.6333333,size.height*0.1833333);
    path_6.cubicTo(size.width*0.6885000,size.height*0.1833333,size.width*0.7333333,size.height*0.2281667,size.width*0.7333333,size.height*0.2833333);
    path_6.close();

    Paint paint_6_fill = Paint()..style=PaintingStyle.fill;
    paint_6_fill.color = fou!;
    canvas.drawPath(path_6,paint_6_fill);

    Path path_7 = Path();
    path_7.moveTo(size.width*0.6333333,size.height*0.1833333);
    path_7.lineTo(size.width*0.3666667,size.height*0.1833333);
    path_7.cubicTo(size.width*0.3115000,size.height*0.1833333,size.width*0.2666667,size.height*0.2281667,size.width*0.2666667,size.height*0.2833333);
    path_7.lineTo(size.width*0.2666667,size.height*0.3333333);
    path_7.cubicTo(size.width*0.2666667,size.height*0.2781667,size.width*0.3115000,size.height*0.2333333,size.width*0.3666667,size.height*0.2333333);
    path_7.lineTo(size.width*0.6333333,size.height*0.2333333);
    path_7.cubicTo(size.width*0.6885000,size.height*0.2333333,size.width*0.7333333,size.height*0.2781667,size.width*0.7333333,size.height*0.3333333);
    path_7.lineTo(size.width*0.7333333,size.height*0.2833333);
    path_7.cubicTo(size.width*0.7333333,size.height*0.2281667,size.width*0.6885000,size.height*0.1833333,size.width*0.6333333,size.height*0.1833333);
    path_7.close();

    Paint paint_7_fill = Paint()..style=PaintingStyle.fill;
    paint_7_fill.color = fou!;
    canvas.drawPath(path_7,paint_7_fill);
  }@override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }}

class five extends CustomPainter{

  Color ?fiv;
  five({ required this.fiv});
  @override
  void paint(Canvas canvas, Size size) {


    Path path_8 = Path();
    path_8.moveTo(size.width*0.8166667,size.height*0.6333333);
    path_8.lineTo(size.width*0.8000000,size.height*0.7500000);
    path_8.lineTo(size.width*0.7333333,size.height*0.7500000);
    path_8.lineTo(size.width*0.7333333,size.height*0.8000000);
    path_8.cubicTo(size.width*0.7333333,size.height*0.8183333,size.width*0.7183333,size.height*0.8333333,size.width*0.7000000,size.height*0.8333333);
    path_8.cubicTo(size.width*0.6908333,size.height*0.8333333,size.width*0.6825000,size.height*0.8296667,size.width*0.6765000,size.height*0.8235000);
    path_8.cubicTo(size.width*0.6703333,size.height*0.8175000,size.width*0.6666667,size.height*0.8091667,size.width*0.6666667,size.height*0.8000000);
    path_8.lineTo(size.width*0.6666667,size.height*0.7500000);
    path_8.lineTo(size.width*0.6000000,size.height*0.7500000);
    path_8.lineTo(size.width*0.6000000,size.height*0.8000000);
    path_8.cubicTo(size.width*0.6000000,size.height*0.8183333,size.width*0.5850000,size.height*0.8333333,size.width*0.5666667,size.height*0.8333333);
    path_8.cubicTo(size.width*0.5575000,size.height*0.8333333,size.width*0.5491667,size.height*0.8296667,size.width*0.5431667,size.height*0.8235000);
    path_8.cubicTo(size.width*0.5370000,size.height*0.8175000,size.width*0.5333333,size.height*0.8091667,size.width*0.5333333,size.height*0.8000000);
    path_8.lineTo(size.width*0.5333333,size.height*0.7500000);
    path_8.lineTo(size.width*0.4666667,size.height*0.7500000);
    path_8.lineTo(size.width*0.4666667,size.height*0.8000000);
    path_8.cubicTo(size.width*0.4666667,size.height*0.8183333,size.width*0.4516667,size.height*0.8333333,size.width*0.4333333,size.height*0.8333333);
    path_8.cubicTo(size.width*0.4241667,size.height*0.8333333,size.width*0.4158333,size.height*0.8296667,size.width*0.4098333,size.height*0.8235000);
    path_8.cubicTo(size.width*0.4036667,size.height*0.8175000,size.width*0.4000000,size.height*0.8091667,size.width*0.4000000,size.height*0.8000000);
    path_8.lineTo(size.width*0.4000000,size.height*0.7500000);
    path_8.lineTo(size.width*0.3333333,size.height*0.7500000);
    path_8.lineTo(size.width*0.3333333,size.height*0.8000000);
    path_8.cubicTo(size.width*0.3333333,size.height*0.8183333,size.width*0.3183333,size.height*0.8333333,size.width*0.3000000,size.height*0.8333333);
    path_8.cubicTo(size.width*0.2908333,size.height*0.8333333,size.width*0.2825000,size.height*0.8296667,size.width*0.2765000,size.height*0.8235000);
    path_8.cubicTo(size.width*0.2703333,size.height*0.8175000,size.width*0.2666667,size.height*0.8091667,size.width*0.2666667,size.height*0.8000000);
    path_8.lineTo(size.width*0.2666667,size.height*0.7500000);
    path_8.lineTo(size.width*0.2000000,size.height*0.7500000);
    path_8.lineTo(size.width*0.1833333,size.height*0.6333333);
    path_8.lineTo(size.width*0.8166667,size.height*0.6333333);
    path_8.close();

    Paint paint_8_fill = Paint()..style=PaintingStyle.fill;
    paint_8_fill.color = fiv! ;
    canvas.drawPath(path_8,paint_8_fill);
  }@override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }}

class RPSCustomPainter extends CustomPainter {
  Color ?err;Color ?tw;Color ?thr;Color ?fou;Color ?fiv;
  RPSCustomPainter({  this.err,this.tw,this.thr,this.fou,this.fiv});
  @override
  void paint(Canvas canvas, Size size) {


    Path path_1 = Path();
    path_1.moveTo(size.width*0.8166667,size.height*0.6333333);
    path_1.lineTo(size.width*0.7748333,size.height*0.9261667);
    path_1.cubicTo(size.width*0.7701667,size.height*0.9590000,size.width*0.7420000,size.height*0.9833333,size.width*0.7088333,size.height*0.9833333);
    path_1.lineTo(size.width*0.2911667,size.height*0.9833333);
    path_1.cubicTo(size.width*0.2580000,size.height*0.9833333,size.width*0.2298333,size.height*0.9590000,size.width*0.2251667,size.height*0.9261667);
    path_1.lineTo(size.width*0.1833333,size.height*0.6333333);
    path_1.lineTo(size.width*0.8166667,size.height*0.6333333);
    path_1.close();

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = err!;//قاعدة
    canvas.drawPath(path_1,paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width*0.8500000,size.height*0.5500000);
    path_2.lineTo(size.width*0.8500000,size.height*0.6333333);
    path_2.lineTo(size.width*0.1500000,size.height*0.6333333);
    path_2.lineTo(size.width*0.1500000,size.height*0.5500000);
    path_2.cubicTo(size.width*0.1500000,size.height*0.5131667,size.width*0.1798333,size.height*0.4833333,size.width*0.2166667,size.height*0.4833333);
    path_2.lineTo(size.width*0.7833333,size.height*0.4833333);
    path_2.cubicTo(size.width*0.8201667,size.height*0.4833333,size.width*0.8500000,size.height*0.5131667,size.width*0.8500000,size.height*0.5500000);
    path_2.close();




    ///2
    Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    paint_2_fill.color = tw!;
    canvas.drawPath(path_2,paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width*0.7833333,size.height*0.4833333);
    path_3.lineTo(size.width*0.2166667,size.height*0.4833333);
    path_3.cubicTo(size.width*0.1798333,size.height*0.4833333,size.width*0.1500000,size.height*0.5131667,size.width*0.1500000,size.height*0.5500000);
    path_3.lineTo(size.width*0.1500000,size.height*0.6000000);
    path_3.cubicTo(size.width*0.1500000,size.height*0.5631667,size.width*0.1798333,size.height*0.5333333,size.width*0.2166667,size.height*0.5333333);
    path_3.lineTo(size.width*0.7833333,size.height*0.5333333);
    path_3.cubicTo(size.width*0.8201667,size.height*0.5333333,size.width*0.8500000,size.height*0.5631667,size.width*0.8500000,size.height*0.6000000);
    path_3.lineTo(size.width*0.8500000,size.height*0.5500000);
    path_3.cubicTo(size.width*0.8500000,size.height*0.5131667,size.width*0.8201667,size.height*0.4833333,size.width*0.7833333,size.height*0.4833333);
    path_3.close();

    Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
    paint_3_fill.color = tw!;
    canvas.drawPath(path_3,paint_3_fill);
/////
    ///
    ///
    ///
    Path path_4 = Path();
    path_4.moveTo(size.width*0.8000000,size.height*0.4000000);
    path_4.lineTo(size.width*0.8000000,size.height*0.4833333);
    path_4.lineTo(size.width*0.2000000,size.height*0.4833333);
    path_4.lineTo(size.width*0.2000000,size.height*0.4000000);
    path_4.cubicTo(size.width*0.2000000,size.height*0.3631667,size.width*0.2298333,size.height*0.3333333,size.width*0.2666667,size.height*0.3333333);
    path_4.lineTo(size.width*0.7333333,size.height*0.3333333);
    path_4.cubicTo(size.width*0.7701667,size.height*0.3333333,size.width*0.8000000,size.height*0.3631667,size.width*0.8000000,size.height*0.4000000);
    path_4.close();

    Paint paint_4_fill = Paint()..style=PaintingStyle.fill;
    paint_4_fill.color = thr!;
    canvas.drawPath(path_4,paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(size.width*0.7333333,size.height*0.3333333);
    path_5.lineTo(size.width*0.2666667,size.height*0.3333333);
    path_5.cubicTo(size.width*0.2298333,size.height*0.3333333,size.width*0.2000000,size.height*0.3631667,size.width*0.2000000,size.height*0.4000000);
    path_5.lineTo(size.width*0.2000000,size.height*0.4500000);
    path_5.cubicTo(size.width*0.2000000,size.height*0.4131667,size.width*0.2298333,size.height*0.3833333,size.width*0.2666667,size.height*0.3833333);
    path_5.lineTo(size.width*0.7333333,size.height*0.3833333);
    path_5.cubicTo(size.width*0.7701667,size.height*0.3833333,size.width*0.8000000,size.height*0.4131667,size.width*0.8000000,size.height*0.4500000);
    path_5.lineTo(size.width*0.8000000,size.height*0.4000000);
    path_5.cubicTo(size.width*0.8000000,size.height*0.3631667,size.width*0.7701667,size.height*0.3333333,size.width*0.7333333,size.height*0.3333333);
    path_5.close();

    Paint paint_5_fill = Paint()..style=PaintingStyle.fill;
    paint_5_fill.color = thr!;
    canvas.drawPath(path_5,paint_5_fill);

    Path path_6 = Path();
    path_6.moveTo(size.width*0.7333333,size.height*0.2833333);
    path_6.lineTo(size.width*0.7333333,size.height*0.3333333);
    path_6.lineTo(size.width*0.2666667,size.height*0.3333333);
    path_6.lineTo(size.width*0.2666667,size.height*0.2833333);
    path_6.cubicTo(size.width*0.2666667,size.height*0.2281667,size.width*0.3115000,size.height*0.1833333,size.width*0.3666667,size.height*0.1833333);
    path_6.lineTo(size.width*0.6333333,size.height*0.1833333);
    path_6.cubicTo(size.width*0.6885000,size.height*0.1833333,size.width*0.7333333,size.height*0.2281667,size.width*0.7333333,size.height*0.2833333);
    path_6.close();

    Paint paint_6_fill = Paint()..style=PaintingStyle.fill;
    paint_6_fill.color = fou!;
    canvas.drawPath(path_6,paint_6_fill);

    Path path_7 = Path();
    path_7.moveTo(size.width*0.6333333,size.height*0.1833333);
    path_7.lineTo(size.width*0.3666667,size.height*0.1833333);
    path_7.cubicTo(size.width*0.3115000,size.height*0.1833333,size.width*0.2666667,size.height*0.2281667,size.width*0.2666667,size.height*0.2833333);
    path_7.lineTo(size.width*0.2666667,size.height*0.3333333);
    path_7.cubicTo(size.width*0.2666667,size.height*0.2781667,size.width*0.3115000,size.height*0.2333333,size.width*0.3666667,size.height*0.2333333);
    path_7.lineTo(size.width*0.6333333,size.height*0.2333333);
    path_7.cubicTo(size.width*0.6885000,size.height*0.2333333,size.width*0.7333333,size.height*0.2781667,size.width*0.7333333,size.height*0.3333333);
    path_7.lineTo(size.width*0.7333333,size.height*0.2833333);
    path_7.cubicTo(size.width*0.7333333,size.height*0.2281667,size.width*0.6885000,size.height*0.1833333,size.width*0.6333333,size.height*0.1833333);
    path_7.close();

    Paint paint_7_fill = Paint()..style=PaintingStyle.fill;
    paint_7_fill.color = fou!;
    canvas.drawPath(path_7,paint_7_fill);

    Path path_8 = Path();
    path_8.moveTo(size.width*0.8166667,size.height*0.6333333);
    path_8.lineTo(size.width*0.8000000,size.height*0.7500000);
    path_8.lineTo(size.width*0.7333333,size.height*0.7500000);
    path_8.lineTo(size.width*0.7333333,size.height*0.8000000);
    path_8.cubicTo(size.width*0.7333333,size.height*0.8183333,size.width*0.7183333,size.height*0.8333333,size.width*0.7000000,size.height*0.8333333);
    path_8.cubicTo(size.width*0.6908333,size.height*0.8333333,size.width*0.6825000,size.height*0.8296667,size.width*0.6765000,size.height*0.8235000);
    path_8.cubicTo(size.width*0.6703333,size.height*0.8175000,size.width*0.6666667,size.height*0.8091667,size.width*0.6666667,size.height*0.8000000);
    path_8.lineTo(size.width*0.6666667,size.height*0.7500000);
    path_8.lineTo(size.width*0.6000000,size.height*0.7500000);
    path_8.lineTo(size.width*0.6000000,size.height*0.8000000);
    path_8.cubicTo(size.width*0.6000000,size.height*0.8183333,size.width*0.5850000,size.height*0.8333333,size.width*0.5666667,size.height*0.8333333);
    path_8.cubicTo(size.width*0.5575000,size.height*0.8333333,size.width*0.5491667,size.height*0.8296667,size.width*0.5431667,size.height*0.8235000);
    path_8.cubicTo(size.width*0.5370000,size.height*0.8175000,size.width*0.5333333,size.height*0.8091667,size.width*0.5333333,size.height*0.8000000);
    path_8.lineTo(size.width*0.5333333,size.height*0.7500000);
    path_8.lineTo(size.width*0.4666667,size.height*0.7500000);
    path_8.lineTo(size.width*0.4666667,size.height*0.8000000);
    path_8.cubicTo(size.width*0.4666667,size.height*0.8183333,size.width*0.4516667,size.height*0.8333333,size.width*0.4333333,size.height*0.8333333);
    path_8.cubicTo(size.width*0.4241667,size.height*0.8333333,size.width*0.4158333,size.height*0.8296667,size.width*0.4098333,size.height*0.8235000);
    path_8.cubicTo(size.width*0.4036667,size.height*0.8175000,size.width*0.4000000,size.height*0.8091667,size.width*0.4000000,size.height*0.8000000);
    path_8.lineTo(size.width*0.4000000,size.height*0.7500000);
    path_8.lineTo(size.width*0.3333333,size.height*0.7500000);
    path_8.lineTo(size.width*0.3333333,size.height*0.8000000);
    path_8.cubicTo(size.width*0.3333333,size.height*0.8183333,size.width*0.3183333,size.height*0.8333333,size.width*0.3000000,size.height*0.8333333);
    path_8.cubicTo(size.width*0.2908333,size.height*0.8333333,size.width*0.2825000,size.height*0.8296667,size.width*0.2765000,size.height*0.8235000);
    path_8.cubicTo(size.width*0.2703333,size.height*0.8175000,size.width*0.2666667,size.height*0.8091667,size.width*0.2666667,size.height*0.8000000);
    path_8.lineTo(size.width*0.2666667,size.height*0.7500000);
    path_8.lineTo(size.width*0.2000000,size.height*0.7500000);
    path_8.lineTo(size.width*0.1833333,size.height*0.6333333);
    path_8.lineTo(size.width*0.8166667,size.height*0.6333333);
    path_8.close();

    Paint paint_8_fill = Paint()..style=PaintingStyle.fill;
    paint_8_fill.color = fiv!;
    canvas.drawPath(path_8,paint_8_fill);

    Paint paint_9_fill = Paint()..style=PaintingStyle.fill;
    paint_9_fill.color = Color(0xffF95754).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5000000,size.height*0.1000000),size.width*0.08333333,paint_9_fill);

    Path path_10 = Path();
    path_10.moveTo(size.width*0.4500000,size.height*0.1333333);
    path_10.cubicTo(size.width*0.4500000,size.height*0.08733333,size.width*0.4873333,size.height*0.05000000,size.width*0.5333333,size.height*0.05000000);
    path_10.cubicTo(size.width*0.5477333,size.height*0.05000000,size.width*0.5610833,size.height*0.05400000,size.width*0.5729000,size.height*0.06043333);
    path_10.cubicTo(size.width*0.5587667,size.height*0.03448333,size.width*0.5316000,size.height*0.01666667,size.width*0.5000000,size.height*0.01666667);
    path_10.cubicTo(size.width*0.4540000,size.height*0.01666667,size.width*0.4166667,size.height*0.05400000,size.width*0.4166667,size.height*0.1000000);
    path_10.cubicTo(size.width*0.4166667,size.height*0.1316000,size.width*0.4344833,size.height*0.1587667,size.width*0.4604333,size.height*0.1729000);
    path_10.cubicTo(size.width*0.4540000,size.height*0.1610833,size.width*0.4500000,size.height*0.1477333,size.width*0.4500000,size.height*0.1333333);
    path_10.close();

    Paint paint_10_fill = Paint()..style=PaintingStyle.fill;
    paint_10_fill.color = Color(0xffFA7976).withOpacity(1.0);
    canvas.drawPath(path_10,paint_10_fill);

    Paint paint_11_fill = Paint()..style=PaintingStyle.fill;
    paint_11_fill.color = Color(0xffFEF0D8).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.3666667,size.height*0.2333333),size.width*0.01666667,paint_11_fill);

    Paint paint_12_fill = Paint()..style=PaintingStyle.fill;
    paint_12_fill.color = Color(0xffFEF0D8).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.4333333,size.height*0.2833333),size.width*0.01666667,paint_12_fill);

    Paint paint_13_fill = Paint()..style=PaintingStyle.fill;
    paint_13_fill.color = Color(0xffFEF0D8).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5000000,size.height*0.2333333),size.width*0.01666667,paint_13_fill);

    Paint paint_14_fill = Paint()..style=PaintingStyle.fill;
    paint_14_fill.color = Color(0xffFEF0D8).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5666667,size.height*0.2833333),size.width*0.01666667,paint_14_fill);

    Paint paint_15_fill = Paint()..style=PaintingStyle.fill;
    paint_15_fill.color = Color(0xffFEF0D8).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.6333333,size.height*0.2333333),size.width*0.01666667,paint_15_fill);

    Paint paint_16_fill = Paint()..style=PaintingStyle.fill;
    paint_16_fill.color = Color(0xffE4E2FE).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.2666667,size.height*0.3833333),size.width*0.01666667,paint_16_fill);

    Paint paint_17_fill = Paint()..style=PaintingStyle.fill;
    paint_17_fill.color = Color(0xffE4E2FE).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.3333333,size.height*0.4333333),size.width*0.01666667,paint_17_fill);

    Paint paint_18_fill = Paint()..style=PaintingStyle.fill;
    paint_18_fill.color = Color(0xffE4E2FE).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.4000000,size.height*0.3833333),size.width*0.01666667,paint_18_fill);

    Paint paint_19_fill = Paint()..style=PaintingStyle.fill;
    paint_19_fill.color = Color(0xffE4E2FE).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.4666667,size.height*0.4333333),size.width*0.01666667,paint_19_fill);

    Paint paint_20_fill = Paint()..style=PaintingStyle.fill;
    paint_20_fill.color = Color(0xffE4E2FE).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5333333,size.height*0.3833333),size.width*0.01666667,paint_20_fill);

    Paint paint_21_fill = Paint()..style=PaintingStyle.fill;
    paint_21_fill.color = Color(0xffE4E2FE).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.6000000,size.height*0.3833333),size.width*0.01666667,paint_21_fill);

    Paint paint_22_fill = Paint()..style=PaintingStyle.fill;
    paint_22_fill.color = Color(0xffE4E2FE).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.6666667,size.height*0.4333333),size.width*0.01666667,paint_22_fill);

    Path path_23 = Path();
    path_23.moveTo(size.width*0.3333333,size.height*0.4833333);
    path_23.lineTo(size.width*0.3333333,size.height*0.5333333);
    path_23.cubicTo(size.width*0.3333333,size.height*0.5516667,size.width*0.3183333,size.height*0.5666667,size.width*0.3000000,size.height*0.5666667);
    path_23.cubicTo(size.width*0.2816667,size.height*0.5666667,size.width*0.2666667,size.height*0.5516667,size.width*0.2666667,size.height*0.5333333);
    path_23.lineTo(size.width*0.2666667,size.height*0.4833333);
    path_23.lineTo(size.width*0.3333333,size.height*0.4833333);
    path_23.close();

    Paint paint_23_fill = Paint()..style=PaintingStyle.fill;
    paint_23_fill.color = Color(0xffFEDDDD).withOpacity(1.0);
    canvas.drawPath(path_23,paint_23_fill);

    Path path_24 = Path();
    path_24.moveTo(size.width*0.4666667,size.height*0.4833333);
    path_24.lineTo(size.width*0.4666667,size.height*0.5333333);
    path_24.cubicTo(size.width*0.4666667,size.height*0.5516667,size.width*0.4516667,size.height*0.5666667,size.width*0.4333333,size.height*0.5666667);
    path_24.cubicTo(size.width*0.4150000,size.height*0.5666667,size.width*0.4000000,size.height*0.5516667,size.width*0.4000000,size.height*0.5333333);
    path_24.lineTo(size.width*0.4000000,size.height*0.4833333);
    path_24.lineTo(size.width*0.4666667,size.height*0.4833333);
    path_24.close();

    Paint paint_24_fill = Paint()..style=PaintingStyle.fill;
    paint_24_fill.color = Color(0xffFEDDDD).withOpacity(1.0);
    canvas.drawPath(path_24,paint_24_fill);

    Path path_25 = Path();
    path_25.moveTo(size.width*0.6000000,size.height*0.4833333);
    path_25.lineTo(size.width*0.6000000,size.height*0.5333333);
    path_25.cubicTo(size.width*0.6000000,size.height*0.5516667,size.width*0.5850000,size.height*0.5666667,size.width*0.5666667,size.height*0.5666667);
    path_25.cubicTo(size.width*0.5483333,size.height*0.5666667,size.width*0.5333333,size.height*0.5516667,size.width*0.5333333,size.height*0.5333333);
    path_25.lineTo(size.width*0.5333333,size.height*0.4833333);
    path_25.lineTo(size.width*0.6000000,size.height*0.4833333);
    path_25.close();

    Paint paint_25_fill = Paint()..style=PaintingStyle.fill;
    paint_25_fill.color = Color(0xffFEDDDD).withOpacity(1.0);
    canvas.drawPath(path_25,paint_25_fill);

    Path path_26 = Path();
    path_26.moveTo(size.width*0.7333333,size.height*0.4833333);
    path_26.lineTo(size.width*0.7333333,size.height*0.5333333);
    path_26.cubicTo(size.width*0.7333333,size.height*0.5516667,size.width*0.7183333,size.height*0.5666667,size.width*0.7000000,size.height*0.5666667);
    path_26.cubicTo(size.width*0.6816667,size.height*0.5666667,size.width*0.6666667,size.height*0.5516667,size.width*0.6666667,size.height*0.5333333);
    path_26.lineTo(size.width*0.6666667,size.height*0.4833333);
    path_26.lineTo(size.width*0.7333333,size.height*0.4833333);
    path_26.close();

    Paint paint_26_fill = Paint()..style=PaintingStyle.fill;
    paint_26_fill.color = Color(0xffFEDDDD).withOpacity(1.0);
    canvas.drawPath(path_26,paint_26_fill);

    Path path_27 = Path();
    path_27.moveTo(size.width*0.9000000,size.height*0.6166667);
    path_27.lineTo(size.width*0.8666667,size.height*0.6166667);
    path_27.lineTo(size.width*0.8666667,size.height*0.5500000);
    path_27.cubicTo(size.width*0.8666667,size.height*0.5159167,size.width*0.8460500,size.height*0.4866333,size.width*0.8166667,size.height*0.4737333);
    path_27.lineTo(size.width*0.8166667,size.height*0.4000000);
    path_27.cubicTo(size.width*0.8166667,size.height*0.3597667,size.width*0.7879833,size.height*0.3261000,size.width*0.7500000,size.height*0.3183500);
    path_27.lineTo(size.width*0.7500000,size.height*0.2833333);
    path_27.cubicTo(size.width*0.7500000,size.height*0.2190167,size.width*0.6976500,size.height*0.1666667,size.width*0.6333333,size.height*0.1666667);
    path_27.lineTo(size.width*0.5743333,size.height*0.1666667);
    path_27.cubicTo(size.width*0.5867000,size.height*0.1528833,size.width*0.5952833,size.height*0.1357000,size.width*0.5985000,size.height*0.1166667);
    path_27.lineTo(size.width*0.6500000,size.height*0.1166667);
    path_27.cubicTo(size.width*0.6592167,size.height*0.1166667,size.width*0.6666667,size.height*0.1092167,size.width*0.6666667,size.height*0.1000000);
    path_27.cubicTo(size.width*0.6666667,size.height*0.09078333,size.width*0.6592167,size.height*0.08333333,size.width*0.6500000,size.height*0.08333333);
    path_27.lineTo(size.width*0.5985000,size.height*0.08333333);
    path_27.cubicTo(size.width*0.5905167,size.height*0.03611667,size.width*0.5494500,0,size.width*0.5000000,0);
    path_27.cubicTo(size.width*0.4448500,0,size.width*0.4000000,size.height*0.04485000,size.width*0.4000000,size.height*0.1000000);
    path_27.cubicTo(size.width*0.4000000,size.height*0.1256333,size.width*0.4097667,size.height*0.1489500,size.width*0.4256667,size.height*0.1666667);
    path_27.lineTo(size.width*0.3666667,size.height*0.1666667);
    path_27.cubicTo(size.width*0.3023333,size.height*0.1666667,size.width*0.2500000,size.height*0.2190167,size.width*0.2500000,size.height*0.2833333);
    path_27.lineTo(size.width*0.2500000,size.height*0.3183500);
    path_27.cubicTo(size.width*0.2120167,size.height*0.3261000,size.width*0.1833333,size.height*0.3597500,size.width*0.1833333,size.height*0.4000000);
    path_27.lineTo(size.width*0.1833333,size.height*0.4737333);
    path_27.cubicTo(size.width*0.1539500,size.height*0.4866333,size.width*0.1333333,size.height*0.5159167,size.width*0.1333333,size.height*0.5500000);
    path_27.lineTo(size.width*0.1333333,size.height*0.6166667);
    path_27.lineTo(size.width*0.1000000,size.height*0.6166667);
    path_27.cubicTo(size.width*0.09080000,size.height*0.6166667,size.width*0.08333333,size.height*0.6241167,size.width*0.08333333,size.height*0.6333333);
    path_27.cubicTo(size.width*0.08333333,size.height*0.6425500,size.width*0.09080000,size.height*0.6500000,size.width*0.1000000,size.height*0.6500000);
    path_27.lineTo(size.width*0.1500000,size.height*0.6500000);
    path_27.lineTo(size.width*0.1688833,size.height*0.6500000);
    path_27.lineTo(size.width*0.2086667,size.height*0.9285167);
    path_27.cubicTo(size.width*0.2144667,size.height*0.9692667,size.width*0.2499333,size.height,size.width*0.2911667,size.height);
    path_27.lineTo(size.width*0.7088333,size.height);
    path_27.cubicTo(size.width*0.7500667,size.height,size.width*0.7855500,size.height*0.9692667,size.width*0.7913333,size.height*0.9285333);
    path_27.lineTo(size.width*0.8311333,size.height*0.6500000);
    path_27.lineTo(size.width*0.8500000,size.height*0.6500000);
    path_27.lineTo(size.width*0.9000000,size.height*0.6500000);
    path_27.cubicTo(size.width*0.9092167,size.height*0.6500000,size.width*0.9166667,size.height*0.6425500,size.width*0.9166667,size.height*0.6333333);
    path_27.cubicTo(size.width*0.9166667,size.height*0.6241167,size.width*0.9092167,size.height*0.6166667,size.width*0.9000000,size.height*0.6166667);
    path_27.close();
    path_27.moveTo(size.width*0.4333333,size.height*0.1000000);
    path_27.cubicTo(size.width*0.4333333,size.height*0.06323333,size.width*0.4632333,size.height*0.03333333,size.width*0.5000000,size.height*0.03333333);
    path_27.cubicTo(size.width*0.5367667,size.height*0.03333333,size.width*0.5666667,size.height*0.06323333,size.width*0.5666667,size.height*0.1000000);
    path_27.cubicTo(size.width*0.5666667,size.height*0.1367667,size.width*0.5367667,size.height*0.1666667,size.width*0.5000000,size.height*0.1666667);
    path_27.cubicTo(size.width*0.4632333,size.height*0.1666667,size.width*0.4333333,size.height*0.1367667,size.width*0.4333333,size.height*0.1000000);
    path_27.close();
    path_27.moveTo(size.width*0.2833333,size.height*0.2833333);
    path_27.cubicTo(size.width*0.2833333,size.height*0.2373833,size.width*0.3207167,size.height*0.2000000,size.width*0.3666667,size.height*0.2000000);
    path_27.lineTo(size.width*0.6333333,size.height*0.2000000);
    path_27.cubicTo(size.width*0.6792833,size.height*0.2000000,size.width*0.7166667,size.height*0.2373833,size.width*0.7166667,size.height*0.2833333);
    path_27.lineTo(size.width*0.7166667,size.height*0.3166667);
    path_27.lineTo(size.width*0.2833333,size.height*0.3166667);
    path_27.lineTo(size.width*0.2833333,size.height*0.2833333);
    path_27.close();
    path_27.moveTo(size.width*0.2166667,size.height*0.4000000);
    path_27.cubicTo(size.width*0.2166667,size.height*0.3724333,size.width*0.2391000,size.height*0.3500000,size.width*0.2666667,size.height*0.3500000);
    path_27.lineTo(size.width*0.7333333,size.height*0.3500000);
    path_27.cubicTo(size.width*0.7609000,size.height*0.3500000,size.width*0.7833333,size.height*0.3724333,size.width*0.7833333,size.height*0.4000000);
    path_27.lineTo(size.width*0.7833333,size.height*0.4666667);
    path_27.lineTo(size.width*0.2166667,size.height*0.4666667);
    path_27.lineTo(size.width*0.2166667,size.height*0.4000000);
    path_27.close();
    path_27.moveTo(size.width*0.6833333,size.height*0.5000000);
    path_27.lineTo(size.width*0.7166667,size.height*0.5000000);
    path_27.lineTo(size.width*0.7166667,size.height*0.5333333);
    path_27.cubicTo(size.width*0.7166667,size.height*0.5425333,size.width*0.7092000,size.height*0.5500000,size.width*0.7000000,size.height*0.5500000);
    path_27.cubicTo(size.width*0.6908000,size.height*0.5500000,size.width*0.6833333,size.height*0.5425333,size.width*0.6833333,size.height*0.5333333);
    path_27.lineTo(size.width*0.6833333,size.height*0.5000000);
    path_27.close();
    path_27.moveTo(size.width*0.5500000,size.height*0.5000000);
    path_27.lineTo(size.width*0.5833333,size.height*0.5000000);
    path_27.lineTo(size.width*0.5833333,size.height*0.5333333);
    path_27.cubicTo(size.width*0.5833333,size.height*0.5425333,size.width*0.5758667,size.height*0.5500000,size.width*0.5666667,size.height*0.5500000);
    path_27.cubicTo(size.width*0.5574667,size.height*0.5500000,size.width*0.5500000,size.height*0.5425333,size.width*0.5500000,size.height*0.5333333);
    path_27.lineTo(size.width*0.5500000,size.height*0.5000000);
    path_27.close();
    path_27.moveTo(size.width*0.4166667,size.height*0.5000000);
    path_27.lineTo(size.width*0.4500000,size.height*0.5000000);
    path_27.lineTo(size.width*0.4500000,size.height*0.5333333);
    path_27.cubicTo(size.width*0.4500000,size.height*0.5425333,size.width*0.4425167,size.height*0.5500000,size.width*0.4333333,size.height*0.5500000);
    path_27.cubicTo(size.width*0.4241500,size.height*0.5500000,size.width*0.4166667,size.height*0.5425333,size.width*0.4166667,size.height*0.5333333);
    path_27.lineTo(size.width*0.4166667,size.height*0.5000000);
    path_27.close();
    path_27.moveTo(size.width*0.2833333,size.height*0.5000000);
    path_27.lineTo(size.width*0.3166667,size.height*0.5000000);
    path_27.lineTo(size.width*0.3166667,size.height*0.5333333);
    path_27.cubicTo(size.width*0.3166667,size.height*0.5425333,size.width*0.3091833,size.height*0.5500000,size.width*0.3000000,size.height*0.5500000);
    path_27.cubicTo(size.width*0.2908167,size.height*0.5500000,size.width*0.2833333,size.height*0.5425333,size.width*0.2833333,size.height*0.5333333);
    path_27.lineTo(size.width*0.2833333,size.height*0.5000000);
    path_27.close();
    path_27.moveTo(size.width*0.7855500,size.height*0.7333333);
    path_27.lineTo(size.width*0.7333333,size.height*0.7333333);
    path_27.cubicTo(size.width*0.7241167,size.height*0.7333333,size.width*0.7166667,size.height*0.7407833,size.width*0.7166667,size.height*0.7500000);
    path_27.lineTo(size.width*0.7166667,size.height*0.8000000);
    path_27.cubicTo(size.width*0.7166667,size.height*0.8092000,size.width*0.7092000,size.height*0.8166667,size.width*0.7000000,size.height*0.8166667);
    path_27.cubicTo(size.width*0.6955500,size.height*0.8166667,size.width*0.6914333,size.height*0.8149500,size.width*0.6881167,size.height*0.8115500);
    path_27.cubicTo(size.width*0.6850500,size.height*0.8085667,size.width*0.6833333,size.height*0.8044500,size.width*0.6833333,size.height*0.8000000);
    path_27.lineTo(size.width*0.6833333,size.height*0.7500000);
    path_27.cubicTo(size.width*0.6833333,size.height*0.7407833,size.width*0.6758833,size.height*0.7333333,size.width*0.6666667,size.height*0.7333333);
    path_27.lineTo(size.width*0.6000000,size.height*0.7333333);
    path_27.cubicTo(size.width*0.5907833,size.height*0.7333333,size.width*0.5833333,size.height*0.7407833,size.width*0.5833333,size.height*0.7500000);
    path_27.lineTo(size.width*0.5833333,size.height*0.8000000);
    path_27.cubicTo(size.width*0.5833333,size.height*0.8092000,size.width*0.5758667,size.height*0.8166667,size.width*0.5666667,size.height*0.8166667);
    path_27.cubicTo(size.width*0.5622167,size.height*0.8166667,size.width*0.5581000,size.height*0.8149500,size.width*0.5547833,size.height*0.8115500);
    path_27.cubicTo(size.width*0.5517167,size.height*0.8085667,size.width*0.5500000,size.height*0.8044500,size.width*0.5500000,size.height*0.8000000);
    path_27.lineTo(size.width*0.5500000,size.height*0.7500000);
    path_27.cubicTo(size.width*0.5500000,size.height*0.7407833,size.width*0.5425500,size.height*0.7333333,size.width*0.5333333,size.height*0.7333333);
    path_27.lineTo(size.width*0.4666667,size.height*0.7333333);
    path_27.cubicTo(size.width*0.4574667,size.height*0.7333333,size.width*0.4500000,size.height*0.7407833,size.width*0.4500000,size.height*0.7500000);
    path_27.lineTo(size.width*0.4500000,size.height*0.8000000);
    path_27.cubicTo(size.width*0.4500000,size.height*0.8092000,size.width*0.4425167,size.height*0.8166667,size.width*0.4333333,size.height*0.8166667);
    path_27.cubicTo(size.width*0.4288833,size.height*0.8166667,size.width*0.4247833,size.height*0.8149500,size.width*0.4214667,size.height*0.8115667);
    path_27.cubicTo(size.width*0.4183667,size.height*0.8085500,size.width*0.4166667,size.height*0.8044500,size.width*0.4166667,size.height*0.8000000);
    path_27.lineTo(size.width*0.4166667,size.height*0.7500000);
    path_27.cubicTo(size.width*0.4166667,size.height*0.7407833,size.width*0.4092000,size.height*0.7333333,size.width*0.4000000,size.height*0.7333333);
    path_27.lineTo(size.width*0.3333333,size.height*0.7333333);
    path_27.cubicTo(size.width*0.3241333,size.height*0.7333333,size.width*0.3166667,size.height*0.7407833,size.width*0.3166667,size.height*0.7500000);
    path_27.lineTo(size.width*0.3166667,size.height*0.8000000);
    path_27.cubicTo(size.width*0.3166667,size.height*0.8092000,size.width*0.3091833,size.height*0.8166667,size.width*0.3000000,size.height*0.8166667);
    path_27.cubicTo(size.width*0.2955500,size.height*0.8166667,size.width*0.2914500,size.height*0.8149500,size.width*0.2881333,size.height*0.8115667);
    path_27.cubicTo(size.width*0.2850333,size.height*0.8085500,size.width*0.2833333,size.height*0.8044500,size.width*0.2833333,size.height*0.8000000);
    path_27.lineTo(size.width*0.2833333,size.height*0.7500000);
    path_27.cubicTo(size.width*0.2833333,size.height*0.7407833,size.width*0.2758667,size.height*0.7333333,size.width*0.2666667,size.height*0.7333333);
    path_27.lineTo(size.width*0.2144500,size.height*0.7333333);
    path_27.lineTo(size.width*0.2025500,size.height*0.6500000);
    path_27.lineTo(size.width*0.7974500,size.height*0.6500000);
    path_27.lineTo(size.width*0.7855500,size.height*0.7333333);
    path_27.close();
    path_27.moveTo(size.width*0.7583333,size.height*0.9238333);
    path_27.cubicTo(size.width*0.7548667,size.height*0.9482500,size.width*0.7335833,size.height*0.9666667,size.width*0.7088333,size.height*0.9666667);
    path_27.lineTo(size.width*0.2911667,size.height*0.9666667);
    path_27.cubicTo(size.width*0.2664167,size.height*0.9666667,size.width*0.2451333,size.height*0.9482500,size.width*0.2416500,size.height*0.9238167);
    path_27.lineTo(size.width*0.2192167,size.height*0.7666667);
    path_27.lineTo(size.width*0.2500000,size.height*0.7666667);
    path_27.lineTo(size.width*0.2500000,size.height*0.8000000);
    path_27.cubicTo(size.width*0.2500000,size.height*0.8135167,size.width*0.2552833,size.height*0.8260833,size.width*0.2645667,size.height*0.8351167);
    path_27.cubicTo(size.width*0.2739000,size.height*0.8447333,size.width*0.2864833,size.height*0.8500000,size.width*0.3000000,size.height*0.8500000);
    path_27.cubicTo(size.width*0.3275667,size.height*0.8500000,size.width*0.3500000,size.height*0.8275667,size.width*0.3500000,size.height*0.8000000);
    path_27.lineTo(size.width*0.3500000,size.height*0.7666667);
    path_27.lineTo(size.width*0.3833333,size.height*0.7666667);
    path_27.lineTo(size.width*0.3833333,size.height*0.8000000);
    path_27.cubicTo(size.width*0.3833333,size.height*0.8135167,size.width*0.3886167,size.height*0.8260833,size.width*0.3979000,size.height*0.8351167);
    path_27.cubicTo(size.width*0.4072333,size.height*0.8447333,size.width*0.4198167,size.height*0.8500000,size.width*0.4333333,size.height*0.8500000);
    path_27.cubicTo(size.width*0.4609000,size.height*0.8500000,size.width*0.4833333,size.height*0.8275667,size.width*0.4833333,size.height*0.8000000);
    path_27.lineTo(size.width*0.4833333,size.height*0.7666667);
    path_27.lineTo(size.width*0.5166667,size.height*0.7666667);
    path_27.lineTo(size.width*0.5166667,size.height*0.8000000);
    path_27.cubicTo(size.width*0.5166667,size.height*0.8135333,size.width*0.5219333,size.height*0.8261000,size.width*0.5312167,size.height*0.8351167);
    path_27.cubicTo(size.width*0.5405667,size.height*0.8447333,size.width*0.5531333,size.height*0.8500000,size.width*0.5666667,size.height*0.8500000);
    path_27.cubicTo(size.width*0.5942333,size.height*0.8500000,size.width*0.6166667,size.height*0.8275667,size.width*0.6166667,size.height*0.8000000);
    path_27.lineTo(size.width*0.6166667,size.height*0.7666667);
    path_27.lineTo(size.width*0.6500000,size.height*0.7666667);
    path_27.lineTo(size.width*0.6500000,size.height*0.8000000);
    path_27.cubicTo(size.width*0.6500000,size.height*0.8135333,size.width*0.6552667,size.height*0.8261000,size.width*0.6645500,size.height*0.8351167);
    path_27.cubicTo(size.width*0.6739000,size.height*0.8447333,size.width*0.6864667,size.height*0.8500000,size.width*0.7000000,size.height*0.8500000);
    path_27.cubicTo(size.width*0.7275667,size.height*0.8500000,size.width*0.7500000,size.height*0.8275667,size.width*0.7500000,size.height*0.8000000);
    path_27.lineTo(size.width*0.7500000,size.height*0.7666667);
    path_27.lineTo(size.width*0.7807833,size.height*0.7666667);
    path_27.lineTo(size.width*0.7583333,size.height*0.9238333);
    path_27.close();
    path_27.moveTo(size.width*0.8166667,size.height*0.6166667);
    path_27.lineTo(size.width*0.1833333,size.height*0.6166667);
    path_27.lineTo(size.width*0.1666667,size.height*0.6166667);
    path_27.lineTo(size.width*0.1666667,size.height*0.5500000);
    path_27.cubicTo(size.width*0.1666667,size.height*0.5224333,size.width*0.1891000,size.height*0.5000000,size.width*0.2166667,size.height*0.5000000);
    path_27.lineTo(size.width*0.2500000,size.height*0.5000000);
    path_27.lineTo(size.width*0.2500000,size.height*0.5333333);
    path_27.cubicTo(size.width*0.2500000,size.height*0.5609000,size.width*0.2724333,size.height*0.5833333,size.width*0.3000000,size.height*0.5833333);
    path_27.cubicTo(size.width*0.3275667,size.height*0.5833333,size.width*0.3500000,size.height*0.5609000,size.width*0.3500000,size.height*0.5333333);
    path_27.lineTo(size.width*0.3500000,size.height*0.5000000);
    path_27.lineTo(size.width*0.3833333,size.height*0.5000000);
    path_27.lineTo(size.width*0.3833333,size.height*0.5333333);
    path_27.cubicTo(size.width*0.3833333,size.height*0.5609000,size.width*0.4057667,size.height*0.5833333,size.width*0.4333333,size.height*0.5833333);
    path_27.cubicTo(size.width*0.4609000,size.height*0.5833333,size.width*0.4833333,size.height*0.5609000,size.width*0.4833333,size.height*0.5333333);
    path_27.lineTo(size.width*0.4833333,size.height*0.5000000);
    path_27.lineTo(size.width*0.5166667,size.height*0.5000000);
    path_27.lineTo(size.width*0.5166667,size.height*0.5333333);
    path_27.cubicTo(size.width*0.5166667,size.height*0.5609000,size.width*0.5391000,size.height*0.5833333,size.width*0.5666667,size.height*0.5833333);
    path_27.cubicTo(size.width*0.5942333,size.height*0.5833333,size.width*0.6166667,size.height*0.5609000,size.width*0.6166667,size.height*0.5333333);
    path_27.lineTo(size.width*0.6166667,size.height*0.5000000);
    path_27.lineTo(size.width*0.6500000,size.height*0.5000000);
    path_27.lineTo(size.width*0.6500000,size.height*0.5333333);
    path_27.cubicTo(size.width*0.6500000,size.height*0.5609000,size.width*0.6724333,size.height*0.5833333,size.width*0.7000000,size.height*0.5833333);
    path_27.cubicTo(size.width*0.7275667,size.height*0.5833333,size.width*0.7500000,size.height*0.5609000,size.width*0.7500000,size.height*0.5333333);
    path_27.lineTo(size.width*0.7500000,size.height*0.5000000);
    path_27.lineTo(size.width*0.7833333,size.height*0.5000000);
    path_27.cubicTo(size.width*0.8109000,size.height*0.5000000,size.width*0.8333333,size.height*0.5224333,size.width*0.8333333,size.height*0.5500000);
    path_27.lineTo(size.width*0.8333333,size.height*0.6166667);
    path_27.lineTo(size.width*0.8166667,size.height*0.6166667);
    path_27.close();

    Paint paint_27_fill = Paint()..style=PaintingStyle.fill;
    paint_27_fill.color = Color(0xff132C47).withOpacity(1.0);
    canvas.drawPath(path_27,paint_27_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}




//   class RPSCustomPainter extends CustomPainter {
//   Color? err;
//   RPSCustomPainter({ this.err});

//   @override
//   void paint(Canvas canvas,  Size size) {

//     Path path_0 = Path();
//     path_0.moveTo(81.792,484.324);
//     path_0.lineTo(210.486,484.324);
//     path_0.cubicTo(193.517,470.26,180.332,455.664,171.124,440.721);
//     path_0.cubicTo(164.267,429.597,159.61599999999999,418.195,157.214,406.881);
//     path_0.cubicTo(147.176,406.68199999999996,137.007,404.155,127.387,399.60799999999995);
//     path_0.lineTo(122.718,415.6689999999999);
//     path_0.cubicTo(121.40700000000001,420.17999999999995,117.897,423.7169999999999,113.396,425.06499999999994);
//     path_0.cubicTo(108.89,426.41599999999994,104.019,425.3829999999999,100.446,422.33199999999994);
//     path_0.cubicTo(96.404,418.9309999999999,83.251,410.0229999999999,71.53999999999999,410.0229999999999);
//     path_0.cubicTo(64.874,410.0229999999999,59.59799999999999,412.9879999999999,54.93299999999999,419.3499999999999);
//     path_0.cubicTo(47.76199999999999,429.1319999999999,45.96399999999999,443.5919999999999,50.35999999999999,456.1859999999999);
//     path_0.cubicTo(55.064,469.66,66.19,479.602,81.792,484.324);
//     path_0.close();

//     Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
//     paint_0_fill.color = Color(0xfffeb171).withOpacity(1.0);
//     canvas.drawPath(path_0,paint_0_fill);

//     Path path_1 = Path();
//     path_1.moveTo(461.636,456.22);
//     path_1.cubicTo(466.043,443.591,464.24300000000005,429.093,457.05,419.28200000000004);
//     path_1.cubicTo(452.394,412.93000000000006,447.12100000000004,409.973,440.46000000000004,409.973);
//     path_1.cubicTo(428.60400000000004,409.973,415.218,419.125,411.46500000000003,422.332);
//     path_1.cubicTo(407.898,425.378,403.031,426.416,398.535,425.072);
//     path_1.cubicTo(394.038,423.737,390.526,420.213,389.201,415.714);
//     path_1.lineTo(384.406,399.41);
//     path_1.cubicTo(375.259,403.644,365.628,406.052,356.087,406.41700000000003);
//     path_1.cubicTo(353.716,417.88300000000004,349.025,429.44300000000004,342.07599999999996,440.721);
//     path_1.cubicTo(332.86899999999997,455.664,319.683,470.261,302.71399999999994,484.326);
//     path_1.lineTo(430.26,484.326);
//     path_1.cubicTo(445.831,479.609,456.938,469.68,461.636,456.22);
//     path_1.close();

//     Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
//     paint_1_fill.color = Color(0xfffeb171).withOpacity(1.0);
//     canvas.drawPath(path_1,paint_1_fill);

//     Path path_2 = Path();
//     path_2.moveTo(479.365,402.916);
//     path_2.cubicTo(469.473,389.426,456.019,382.296,440.458,382.296);
//     path_2.cubicTo(429.23900000000003,382.296,418.75500000000005,386.008,410.535,390.166);
//     path_2.lineTo(408.37600000000003,382.827);
//     path_2.cubicTo(408.65500000000003,382.557,408.942,382.299,409.218,382.024);
//     path_2.cubicTo(437.819,353.523,442.284,311.676,419.171,288.478);
//     path_2.cubicTo(411.417,280.694,401.175,275.714,389.738,274.043);
//     path_2.cubicTo(406.221,248.943,415.826,218.942,415.826,186.735);
//     path_2.cubicTo(415.826,168.46200000000002,412.728,150.9,407.04400000000004,134.53900000000002);
//     path_2.cubicTo(427.913,121.77700000000002,441.874,98.77700000000002,441.874,72.57500000000002);
//     path_2.cubicTo(441.877,32.557,409.318,0,369.299,0);
//     path_2.cubicTo(342.825,0,319.626,14.253,306.94899999999996,35.484);
//     path_2.cubicTo(291.03899999999993,30.146,274.018,27.247,256.33199999999994,27.247);
//     path_2.cubicTo(238.81299999999993,27.247,221.94999999999993,30.094,206.16799999999995,35.337);
//     path_2.cubicTo(193.471,14.187,170.316,0,143.903,0);
//     path_2.cubicTo(103.88199999999999,0,71.32499999999999,32.557,71.32499999999999,72.578);
//     path_2.cubicTo(71.32499999999999,98.59700000000001,85.094,121.45,105.72099999999999,134.264);
//     path_2.cubicTo(99.978,150.70700000000002,96.84199999999998,168.36200000000002,96.84199999999998,186.739);
//     path_2.cubicTo(96.84199999999998,218.919,106.42999999999998,248.899,122.88799999999998,273.983);
//     path_2.cubicTo(111.21799999999998,275.56600000000003,100.76299999999998,280.577,92.87499999999997,288.494);
//     path_2.cubicTo(69.76199999999997,311.69100000000003,74.22699999999998,353.74800000000005,102.82799999999997,382.249);
//     path_2.cubicTo(103.02899999999997,382.45000000000005,103.23799999999997,382.636,103.43999999999997,382.834);
//     path_2.lineTo(101.31399999999996,390.151);
//     path_2.cubicTo(93.12499999999997,386.024,82.69699999999996,382.348,71.53799999999997,382.348);
//     path_2.cubicTo(55.971999999999966,382.348,42.51299999999997,389.485,32.611999999999966,402.985);
//     path_2.cubicTo(20.017999999999965,420.158,16.803999999999967,444.03700000000003,24.225999999999967,465.305);
//     path_2.cubicTo(32.19099999999997,488.127,50.648999999999965,504.539,76.19899999999997,511.51300000000003);
//     path_2.cubicTo(77.38699999999997,511.838,78.61199999999997,512.0010000000001,79.84199999999997,512.0010000000001);
//     path_2.lineTo(432.205,512.0010000000001);
//     path_2.cubicTo(433.437,512.0010000000001,434.661,511.8370000000001,435.84799999999996,511.5130000000001);
//     path_2.cubicTo(461.36499999999995,504.5470000000001,479.79999999999995,488.1500000000001,487.76199999999994,465.3410000000001);
//     path_2.cubicTo(495.199,444.037,491.98,420.118,479.365,402.916);
//     path_2.close();
//     path_2.moveTo(54.931,419.349);
//     path_2.cubicTo(59.596,412.98699999999997,64.87299999999999,410.022,71.538,410.022);
//     path_2.cubicTo(83.24799999999999,410.022,96.401,418.93,100.44399999999999,422.331);
//     path_2.cubicTo(104.01799999999999,425.382,108.88999999999999,426.415,113.39399999999999,425.064);
//     path_2.cubicTo(117.895,423.718,121.404,420.18100000000004,122.716,415.668);
//     path_2.lineTo(127.38499999999999,399.607);
//     path_2.cubicTo(137.006,404.15400000000005,147.17499999999998,406.682,157.212,406.88000000000005);
//     path_2.cubicTo(159.61499999999998,418.1940000000001,164.266,429.59700000000004,171.12199999999999,440.72);
//     path_2.cubicTo(180.32899999999998,455.663,193.515,470.259,210.48399999999998,484.32300000000004);
//     path_2.lineTo(81.792,484.32300000000004);
//     path_2.cubicTo(66.19,479.60100000000006,55.064,469.658,50.359,456.182);
//     path_2.cubicTo(45.964,443.589,47.76,429.13,54.931,419.349);
//     path_2.close();
//     path_2.moveTo(112.481,308.027);
//     path_2.cubicTo(118.17399999999999,302.315,125.68599999999999,301.11699999999996,130.98399999999998,301.11699999999996);
//     path_2.cubicTo(143.18699999999998,301.11699999999996,156.69799999999998,307.32199999999995,167.128,317.715);
//     path_2.cubicTo(176.22099999999998,326.775,182.03799999999998,337.828,183.512,348.83799999999997);
//     path_2.cubicTo(184.801,358.486,182.493,366.82899999999995,177.012,372.33099999999996);
//     path_2.cubicTo(171.319,378.044,163.807,379.24299999999994,158.50900000000001,379.24299999999994);
//     path_2.cubicTo(146.306,379.24299999999994,132.79500000000002,373.03799999999995,122.36300000000001,362.6429999999999);
//     path_2.cubicTo(104.872,345.216,100.347,320.204,112.481,308.027);
//     path_2.close();
//     path_2.moveTo(256.332,54.922);
//     path_2.cubicTo(329.017,54.922,388.153,114.055,388.153,186.738);
//     path_2.cubicTo(388.153,221.976,374.22700000000003,254.002,351.62600000000003,277.675);
//     path_2.cubicTo(351.882,275.43,352.03400000000005,273.16,352.03400000000005,270.863);
//     path_2.cubicTo(352.03400000000005,229.30599999999998,309.10200000000003,195.495,256.33200000000005,195.495);
//     path_2.cubicTo(203.56300000000005,195.495,160.63300000000004,229.306,160.63300000000004,270.863);
//     path_2.cubicTo(160.63300000000004,273.16,160.78500000000003,275.429,161.04100000000003,277.675);
//     path_2.cubicTo(138.44200000000004,254,124.51800000000003,221.976,124.51800000000003,186.74);
//     path_2.cubicTo(124.518,114.055,183.649,54.922,256.332,54.922);
//     path_2.close();
//     path_2.moveTo(99.001,72.578);
//     path_2.cubicTo(99.001,47.82000000000001,119.144,27.676000000000002,143.90300000000002,27.676000000000002);
//     path_2.cubicTo(158.94100000000003,27.676000000000002,172.26700000000002,35.116,180.419,46.501000000000005);
//     path_2.cubicTo(153.977,60.870000000000005,132.038,82.50900000000001,117.27700000000002,108.70700000000001);
//     path_2.cubicTo(106.202,100.522,99.001,87.377,99.001,72.578);
//     path_2.close();
//     path_2.moveTo(369.299,27.676);
//     path_2.cubicTo(394.058,27.676,414.20099999999996,47.81999999999999,414.20099999999996,72.578);
//     path_2.cubicTo(414.20099999999996,87.544,406.832,100.81400000000001,395.542,108.97800000000001);
//     path_2.cubicTo(380.85299999999995,82.78500000000001,358.991,61.13400000000001,332.63,46.711000000000006);
//     path_2.cubicTo(340.769,35.207,354.168,27.676,369.299,27.676);
//     path_2.close();
//     path_2.moveTo(399.57,308.027);
//     path_2.cubicTo(411.704,320.204,407.177,345.216,389.688,362.643);
//     path_2.cubicTo(379.256,373.039,365.743,379.24499999999995,353.544,379.243);
//     path_2.cubicTo(348.24399999999997,379.243,340.73199999999997,378.044,335.039,372.331);
//     path_2.cubicTo(329.55699999999996,366.829,327.25,358.486,328.539,348.838);
//     path_2.cubicTo(330.013,337.82800000000003,335.83,326.77500000000003,344.923,317.71500000000003);
//     path_2.cubicTo(355.353,307.321,368.866,301.117,381.067,301.117);
//     path_2.cubicTo(386.365,301.117,393.877,302.315,399.57,308.027);
//     path_2.close();
//     path_2.moveTo(256.6,481.699);
//     path_2.cubicTo(254.728,481.699,252.85700000000003,481.161,251.23600000000002,480.083);
//     path_2.cubicTo(207.36700000000002,450.90900000000005,188.853,423.29400000000004,184.211,400.906);
//     path_2.cubicTo(188.80300000000003,398.543,192.98200000000003,395.511,196.61700000000002,391.865);
//     path_2.cubicTo(207.67000000000002,380.774,212.811,365.35200000000003,211.27100000000002,348.182);
//     path_2.cubicTo(214.85700000000003,347.238,218.247,346.776,221.43300000000002,346.776);
//     path_2.cubicTo(232.82300000000004,346.776,241.723,352.339,248.69400000000002,360.071);
//     path_2.cubicTo(250.65900000000002,362.25,253.33700000000002,363.345,255.99900000000002,363.345);
//     path_2.cubicTo(258.73400000000004,363.345,261.45300000000003,362.19000000000005,263.36800000000005,359.863);
//     path_2.cubicTo(270.00300000000004,351.808,279.20900000000006,346.594,290.68600000000004,346.594);
//     path_2.cubicTo(293.884,346.594,297.259,347,300.80500000000006,347.86);
//     path_2.cubicTo(299.20200000000006,365.105,304.33900000000006,380.51,315.43500000000006,391.646);
//     path_2.cubicTo(319.35600000000005,395.579,323.91800000000006,398.748,328.94100000000003,401.142);
//     path_2.cubicTo(324.21700000000004,423.48699999999997,305.68100000000004,451.01,261.968,480.08);
//     path_2.cubicTo(260.344,481.161,258.472,481.699,256.6,481.699);
//     path_2.close();
//     path_2.moveTo(188.309,270.864);
//     path_2.cubicTo(188.309,253.70699999999997,202.036,238.32399999999998,222.046,229.91299999999998);
//     path_2.cubicTo(221.012,232.63899999999998,220.451,235.53599999999997,220.451,238.539);
//     path_2.cubicTo(220.451,254.66899999999998,236.518,267.74699999999996,256.33299999999997,267.74699999999996);
//     path_2.cubicTo(276.154,267.74699999999996,292.21799999999996,254.66799999999995,292.21799999999996,238.53899999999996);
//     path_2.cubicTo(292.21799999999996,235.53599999999994,291.65799999999996,232.64099999999996,290.62299999999993,229.91499999999996);
//     path_2.cubicTo(310.6309999999999,238.32499999999996,324.35999999999996,253.70699999999997,324.35999999999996,270.86499999999995);
//     path_2.cubicTo(324.35999999999996,296.71799999999996,293.20799999999997,318.55899999999997,256.33299999999997,318.55899999999997);
//     path_2.cubicTo(219.46,318.557,188.309,296.716,188.309,270.864);
//     path_2.close();
//     path_2.moveTo(302.715,484.324);
//     path_2.cubicTo(319.68399999999997,470.26,332.86899999999997,455.66200000000003,342.077,440.719);
//     path_2.cubicTo(349.025,429.441,353.716,417.881,356.088,406.41499999999996);
//     path_2.cubicTo(365.629,406.04999999999995,375.26000000000005,403.64199999999994,384.40700000000004,399.40799999999996);
//     path_2.lineTo(389.20200000000006,415.71199999999993);
//     path_2.cubicTo(390.52700000000004,420.21099999999996,394.03800000000007,423.7339999999999,398.53600000000006,425.06999999999994);
//     path_2.cubicTo(403.03200000000004,426.41399999999993,407.89700000000005,425.3759999999999,411.46600000000007,422.3299999999999);
//     path_2.cubicTo(415.2200000000001,419.12299999999993,428.60400000000004,409.97099999999995,440.46100000000007,409.97099999999995);
//     path_2.cubicTo(447.12200000000007,409.97099999999995,452.3930000000001,412.929,457.05100000000004,419.28);
//     path_2.cubicTo(464.24300000000005,429.09099999999995,466.04400000000004,443.59,461.63700000000006,456.21799999999996);
//     path_2.cubicTo(456.9390000000001,469.679,445.83200000000005,479.60699999999997,430.26300000000003,484.323);
//     path_2.lineTo(302.715,484.323);
//     path_2.close();

//     Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
//     paint_2_fill.color = Color(0xff000000).withOpacity(1.0);
//     canvas.drawPath(path_2,paint_2_fill);

//     Path path_3 = Path();
//     path_3.moveTo(180.42,46.5);
//     path_3.cubicTo(172.268,35.115,158.94199999999998,27.675,143.904,27.675);
//     path_3.cubicTo(119.145,27.675,99.002,47.819,99.002,72.577);
//     path_3.cubicTo(99.002,87.377,106.20299999999999,100.521,117.27799999999999,108.70599999999999);
//     path_3.cubicTo(132.039,82.508,153.977,60.869,180.42,46.5);
//     path_3.close();

//     Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
//     paint_3_fill.color = Color(0xffd99e6d).withOpacity(1.0);
//     canvas.drawPath(path_3,paint_3_fill);

//     Path path_4 = Path();
//     path_4.moveTo(395.543,108.978);
//     path_4.cubicTo(406.833,100.814,414.202,87.54299999999999,414.202,72.578);
//     path_4.cubicTo(414.202,47.82000000000001,394.058,27.676000000000002,369.3,27.676000000000002);
//     path_4.cubicTo(354.168,27.676000000000002,340.77,35.207,332.63100000000003,46.712);
//     path_4.cubicTo(358.992,61.134,380.852,82.783,395.543,108.978);
//     path_4.close();

//     Paint paint_4_fill = Paint()..style=PaintingStyle.fill;
//     paint_4_fill.color = Color(0xffd99e6d).withOpacity(1.0);
//     canvas.drawPath(path_4,paint_4_fill);

//     Path path_5 = Path();
//     path_5.moveTo(160.633,270.864);
//     path_5.cubicTo(160.633,229.30699999999996,203.56300000000002,195.49599999999998,256.332,195.49599999999998);
//     path_5.cubicTo(309.103,195.49599999999998,352.034,229.307,352.034,270.864);
//     path_5.cubicTo(352.034,273.161,351.882,275.43199999999996,351.626,277.676);
//     path_5.cubicTo(374.227,254.00099999999998,388.15299999999996,221.97699999999998,388.15299999999996,186.73899999999998);
//     path_5.cubicTo(388.15299999999996,114.05399999999997,329.01699999999994,54.92299999999997,256.332,54.92299999999997);
//     path_5.cubicTo(183.649,54.92299999999997,124.518,114.05599999999998,124.518,186.73899999999998);
//     path_5.cubicTo(124.518,221.97499999999997,138.442,254.00099999999998,161.041,277.674);
//     path_5.cubicTo(160.786,275.428,160.633,273.161,160.633,270.864);
//     path_5.close();
//     path_5.moveTo(314.546,183.927);
//     path_5.cubicTo(306.904,183.927,300.70799999999997,177.731,300.70799999999997,170.089);
//     path_5.cubicTo(300.70799999999997,162.447,306.904,156.251,314.546,156.251);
//     path_5.cubicTo(322.188,156.251,328.384,162.447,328.384,170.089);
//     path_5.cubicTo(328.384,177.731,322.188,183.927,314.546,183.927);
//     path_5.close();
//     path_5.moveTo(198.655,183.927);
//     path_5.cubicTo(191.013,183.927,184.817,177.731,184.817,170.089);
//     path_5.cubicTo(184.817,162.447,191.013,156.251,198.655,156.251);
//     path_5.cubicTo(206.297,156.251,212.493,162.447,212.493,170.089);
//     path_5.cubicTo(212.492,177.731,206.296,183.927,198.655,183.927);
//     path_5.close();

//     Paint paint_5_fill = Paint()..style=PaintingStyle.fill;
//     paint_5_fill.color = Color(0xfffeb171).withOpacity(1.0);
//     canvas.drawPath(path_5,paint_5_fill);

//     Path path_6 = Path();
//     path_6.moveTo(324.359,270.864);
//     path_6.cubicTo(324.359,253.70699999999997,310.63,238.32399999999998,290.62199999999996,229.914);
//     path_6.cubicTo(291.65599999999995,232.64,292.217,235.536,292.217,238.53799999999998);
//     path_6.cubicTo(292.217,254.66799999999998,276.15299999999996,267.746,256.332,267.746);
//     path_6.cubicTo(236.518,267.746,220.45,254.66699999999997,220.45,238.53799999999998);
//     path_6.cubicTo(220.45,235.53499999999997,221.01,232.63799999999998,222.045,229.91199999999998);
//     path_6.cubicTo(202.03699999999998,238.32399999999998,188.308,253.706,188.308,270.863);
//     path_6.cubicTo(188.308,296.716,219.459,318.557,256.331,318.557);
//     path_6.cubicTo(293.207,318.557,324.359,296.716,324.359,270.864);
//     path_6.close();

//     Paint paint_6_fill = Paint()..style=PaintingStyle.fill;
//     paint_6_fill.color = Color(0xffd99e6d).withOpacity(1.0);
//     canvas.drawPath(path_6,paint_6_fill);

//     Paint paint_7_fill = Paint()..style=PaintingStyle.fill;
//     paint_7_fill.color = Color(0xff000000).withOpacity(1.0);
//     canvas.drawCircle(Offset(size.width*0.3880078,size.height*0.3321953),size.width*0.02702734,paint_7_fill);

//     Paint paint_8_fill = Paint()..style=PaintingStyle.fill;
//     paint_8_fill.color = Color(0xff000000).withOpacity(1.0);
//     canvas.drawCircle(Offset(size.width*0.6143594,size.height*0.3321953),size.width*0.02702734,paint_8_fill);

//     Path path_9 = Path();
//     path_9.moveTo(328.938,401.145);
//     path_9.cubicTo(323.917,398.751,319.354,395.582,315.432,391.649);
//     path_9.cubicTo(304.336,380.511,299.199,365.106,300.802,347.863);
//     path_9.cubicTo(297.25600000000003,347.003,293.88100000000003,346.597,290.683,346.597);
//     path_9.cubicTo(279.206,346.597,270.001,351.81,263.365,359.866);
//     path_9.cubicTo(261.452,362.192,258.731,363.348,255.996,363.348);
//     path_9.cubicTo(253.334,363.348,250.656,362.253,248.691,360.074);
//     path_9.cubicTo(241.72,352.34000000000003,232.821,346.779,221.43,346.779);
//     path_9.cubicTo(218.244,346.779,214.854,347.243,211.268,348.185);
//     path_9.cubicTo(212.809,365.354,207.667,380.777,196.614,391.868);
//     path_9.cubicTo(192.98000000000002,395.514,188.80100000000002,398.546,184.208,400.909);
//     path_9.cubicTo(188.851,423.295,207.364,450.90999999999997,251.233,480.086);
//     path_9.cubicTo(252.854,481.164,254.725,481.702,256.597,481.702);
//     path_9.cubicTo(258.469,481.702,260.34,481.164,261.96099999999996,480.086);
//     path_9.cubicTo(305.676,451.013,324.212,423.49,328.938,401.145);
//     path_9.close();

//     Paint paint_9_fill = Paint()..style=PaintingStyle.fill;
//     paint_9_fill.color = err!;
//     canvas.drawPath(path_9,paint_9_fill);

//     Path path_10 = Path();
//     path_10.moveTo(122.363,362.643);
//     path_10.cubicTo(132.795,373.039,146.308,379.243,158.50900000000001,379.243);
//     path_10.cubicTo(163.80700000000002,379.243,171.31900000000002,378.044,177.012,372.331);
//     path_10.cubicTo(182.494,366.829,184.801,358.486,183.512,348.838);
//     path_10.cubicTo(182.038,337.82800000000003,176.221,326.77500000000003,167.128,317.71500000000003);
//     path_10.cubicTo(156.69799999999998,307.321,143.18499999999997,301.117,130.98399999999998,301.117);
//     path_10.cubicTo(125.68599999999998,301.117,118.17399999999998,302.31600000000003,112.48099999999998,308.02700000000004);
//     path_10.cubicTo(100.347,320.204,104.872,345.216,122.363,362.643);
//     path_10.close();

//     Paint paint_10_fill = Paint()..style=PaintingStyle.fill;
//     paint_10_fill.color = Color(0xfffeb171).withOpacity(1.0);
//     canvas.drawPath(path_10,paint_10_fill);

//     Path path_11 = Path();
//     path_11.moveTo(344.92,317.715);
//     path_11.cubicTo(335.827,326.775,330.01,337.828,328.536,348.83799999999997);
//     path_11.cubicTo(327.247,358.486,329.555,366.82899999999995,335.036,372.33099999999996);
//     path_11.cubicTo(340.729,378.044,348.241,379.24299999999994,353.541,379.24299999999994);
//     path_11.cubicTo(365.743,379.24499999999995,379.253,373.03799999999995,389.685,362.6429999999999);
//     path_11.cubicTo(407.174,345.2159999999999,411.701,320.2039999999999,399.567,308.02699999999993);
//     path_11.cubicTo(393.874,302.31499999999994,386.362,301.1169999999999,381.064,301.1169999999999);
//     path_11.cubicTo(368.863,301.117,355.351,307.321,344.92,317.715);
//     path_11.close();

//     Paint paint_11_fill = Paint()..style=PaintingStyle.fill;
//     paint_11_fill.color = Color(0xfffeb171).withOpacity(1.0);
//     canvas.drawPath(path_11,paint_11_fill);

//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }


