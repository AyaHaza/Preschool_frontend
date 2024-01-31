// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import '../../widgets/ElevatedButton.dart' as button;
// import '../../Controller/Authentication/AuthController.dart';
//
// class Homepagecontent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//       SizedBox(
//         height: 240.h,
//         width: 400.w,
//         child: Card(
//           child: ClipPath(
//             clipper: ShapeBorderClipper(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(3))),
//             child: Container(
//               padding: EdgeInsets.only(top: 20,left: 20),
//               decoration: const BoxDecoration(
//                 border: Border(
//                   left: BorderSide(color: Colors.greenAccent, width: 5),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Fee Notification Message',
//                     style: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Text(
//                     'These Students are Late in making this Payment ..  ',
//                     style:
//                     TextStyle(color:Colors.red,fontSize: 17.sp, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     'Send Notification to them...  ',
//                     style:
//                     TextStyle(color:Colors.red,fontSize: 17.sp, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 4.h,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         'Date : 2023-06-27',
//                         style: TextStyle(
//                             fontSize: 17.sp, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         'Amount : 1500000',
//                         style: TextStyle(
//                             fontSize: 17.sp, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                   Text(
//                     'Student Name : [  hala ,Ghadeer ,Aya ]',
//                     style:
//                         TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
//                   ),
//                   Row(
//                     children: [
//                       SizedBox(width: 220.w,),
//                       button.ButtonElevated(
//                         color: Colors.cyan,
//                         function: () {},
//                         icon: Icons.send,
//                         text: "Send",
//                       ),
//                       SizedBox(width: 10.w,),
//
//                       button.ButtonElevated(
//                         color: Colors.cyan,
//                         function: () {},
//                         icon: Icons.delete_forever,
//                         text: "Delete",
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       )
//     ]);
//   }
// }
//

// Container(
// width: 900.w,
// child: FutureBuilder(
// future: controller.controller.Fetch(),
// builder: (ctx, authResultSnapshot) =>
// authResultSnapshot.connectionState ==
// ConnectionState.waiting
// ? const Center(child: CircularProgressIndicator())
//     : GetBuilder<FileController>(
// builder: (controller2) => ListView.builder(
// shrinkWrap: true,
// itemCount: controller2.Files.length,
// itemBuilder: (BuildContext context, int position) {
// return
import 'package:get/get.dart';
import 'package:project/project/web/Employee/Controller/feesRateController/feesRateControllerr.dart';
import '../../widgets/Dialogs/ErrorDialog.dart';

import '../../../../../CONSTANT/responsive.dart';
import '../../Controller/LateNotification/LateNotification.dart';
import '../../Model/LateNotification.dart';
import '../../widgets/ElevatedButton.dart' as button;
import '../../Controller/CountStudent/CountStudentController.dart';

import '../../Controller/BusRateController/BusRateControllerr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Homepagecontent extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Homepagecontent({Key? key}) : super(key: key);

  @override
  _HomepagecontentState createState() => _HomepagecontentState();
}

class _HomepagecontentState extends State<Homepagecontent> {
  StudentCountController controller= Get.put(StudentCountController(),permanent: false);
  BusRateControllerr controller1= Get.put(BusRateControllerr(),permanent: false);
  feesRateControllerr controller2= Get.put(feesRateControllerr(),permanent: false);
  TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);




  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GetBuilder<LateNotifyController>(
                    builder: (controller2) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller2.Notifications.length,
                        itemBuilder: (BuildContext context, int position) {
                          LateNotification Notify = controller2.Notifications.values.elementAt(position);
                         String  Names = "";
                          Notify.studentsInfo!.forEach((element) {Names+=element.name!; });
                          return Expanded(
                            child: Card(
                              child: ClipPath(
                                clipper: ShapeBorderClipper(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(3))),
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 20.w, left: 20.w, right: 10.w),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                          color: Colors.greenAccent, width: 5),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Fee Notification Message',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Text(
                                        'These Students are Late in making this Payment ..  ',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Send Notification to them...  ',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Date : 2023-06-27',
                                            style: TextStyle(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Amount :${Notify.amount}',
                                            style: TextStyle(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Student Name : [ $Names ]',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10.h,),
                                      if (Responsive.isDesktop(context))
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            button.ButtonElevated(
                                              color: Colors.cyan,
                                              function: ()=>controller2.send(Notify.id!,Notify.studentsInfo),
                                              icon: Icons.send,
                                              text: "Send",
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            button.ButtonElevated(
                                              color: Colors.cyan,
                                              function: ()
                                                  {controller2.Delete(Notify.id!);
                                                Dialogs.Success("Deleted Successfully");
                                                },
                                              icon: Icons.delete_forever,
                                              text: "Delete",
                                            )
                                          ],
                                        )
                                      else
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            button.ButtonElevated(
                                              color: Colors.cyan,
                                              function: ()=>controller2.send(Notify.id!,Notify.studentsInfo),
                                              icon: Icons.send,
                                              text: "Send",
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            button.ButtonElevated(
                                              color: Colors.cyan,
                                              function: ()
                                              {controller2.Delete(Notify.id!);
                                              Dialogs.Success("Deleted Successfully");
                                              },
                                              icon: Icons.delete_forever,
                                              text: "Delete",
                                            )
                                          ],
                                        )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
              ]






          ),

          SizedBox(
            height: 30.h,
          ),

  Wrap(
      direction: Responsive.isDesktop(context)
          ? Axis.horizontal
          : Axis.vertical,
      alignment: WrapAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround
                ,children: [
              Container(
                width: 300.w,
                height: 400.h,
                child: GetBuilder<StudentCountController>(
                    builder: (controller)
                    {
                      return ListView.builder(

                          itemCount:controller.Counts.values.length,
                          itemBuilder: (BuildContext ctx, index) {
                            print( "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${controller.Counts.values.elementAt(index).bus_count}");
                            return
                SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                      title: AxisTitle(text: "Role"), isVisible: true),
                  primaryYAxis:
                  NumericAxis(title: AxisTitle(text: "Number")),
                  legend: Legend(
                    isVisible: true,
                    overflowMode: LegendItemOverflowMode.wrap,
                  ),
                  tooltipBehavior: _tooltipBehavior,
                  title: ChartTitle(text: "The Premium For All Worker In PreSchool"),
                  series: <ChartSeries>[
                    StackedColumnSeries<Counting, String>(
                      name: "",
                      //   maximumValue: 60,
                      dataSource:[
                    Counting('Emoployee', controller.Counts.values.elementAt(index).employee_count!),
      Counting('Bus supervisor', controller.Counts.values.elementAt(index).bus_count!),
      Counting('Teacher', controller.Counts.values.elementAt(index).teacher_count!),
      Counting('Student', controller.Counts.values.elementAt(index).student_count!),
      ],
                      xValueMapper: (Counting data, _) => data.role,
                      yValueMapper: (Counting data, _) => data.numb,

                      markerSettings: MarkerSettings(isVisible: true),
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                      enableTooltip: true,
                    ),
                  ],
                );});}),
              ),
              Container(
                  height: 400.h,
                  width: 300.w,
                  child: GetBuilder<feesRateControllerr>(
                      builder: (controller)
                      {
                        return ListView.builder(

                            itemCount:controller.feesRates.values.length,
                            itemBuilder: (BuildContext ctx, index) {
                             // print( "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${controller.feesRates.values.elementAt(index).bus_count}");
                              return
                                Container(
                                  width: 500,
                                  child: SfCircularChart(
                                    legend: Legend(
                                      isVisible: true,
                                      overflowMode: LegendItemOverflowMode.wrap,
                                    ),
                                    tooltipBehavior: _tooltipBehavior,
                                    title:
                                    ChartTitle(text: "Total Fees Is (  ${controller.feesRates.values.elementAt(index).full}  ) In PrSchool"),
                                    series: <CircularSeries>[
                                      PieSeries<Counting, String>(
                                        dataSource: [
                                          Counting('paided', controller.feesRates.values.elementAt(index).paided!),
                                          Counting('unpaided', controller.feesRates.values.elementAt(index).unpaided!),

                                        ],
                                        xValueMapper: (Counting data, _) => data.role,
                                        yValueMapper: (Counting data, _) => data.numb,
                                        dataLabelSettings:
                                        DataLabelSettings(isVisible: true),
                                        enableTooltip: true,

                                      )
                                    ],
                                  ),
                                );});
                      }) ),

           ]),
            Container(
                width: 500.w,
                height: 300.h,
                child:  GetBuilder<BusRateControllerr>(
                    builder: (controller)
                    {
                      return ListView.builder(

                          itemCount:controller.BusRates.values.length,
                          itemBuilder: (BuildContext ctx, index) {

                            return SfCircularChart(
                              legend: Legend(
                                isVisible: true,
                                overflowMode: LegendItemOverflowMode.wrap,
                              ),
                              tooltipBehavior: _tooltipBehavior,
                              title: ChartTitle(
                                  text:
                                  "Number The Studentes with/without Bus In PrSchool"),
                              series: <CircularSeries>[
                                DoughnutSeries<Counting, String>(
                                  dataSource:[
                                    Counting('Number Studentes whith Bus', controller1.BusRates.values.first.student_with_bus!),
                                    Counting('Number Studentes whithout Bus', controller1.BusRates.values.first.student_without_bus!),
                                  ],
                                  xValueMapper: (Counting data, _) => data.role,
                                  yValueMapper: (Counting data, _) => data.numb,
                                  dataLabelSettings:
                                  DataLabelSettings(isVisible: true),
                                  enableTooltip: true,
                                )
                              ],
                            );

                          });
                    })    )

          ],
        )

      ],)
      ],
      ),
    ));
  }
}

class _SalesData {
  _SalesData(this.role1,this.numb1);
  // _SalesData(this.month, this.adam, this.ahmed, this.ali, this.boshra,
  //     this.doaa, this.elham, this.esraa, this.eva, this.lama, this.leen);
  final String role1;
  final int numb1;
  // final String month;
  //
  // final num leen;
  // final num ahmed;
  // final num adam;
  // final num lama;
  // final num boshra;
  // final num ali;
  // final num eva;
  // final num doaa;
  // final num esraa;
  // final num elham;
}

class Counting {
  Counting(this.role, this.numb);

  final String role;
  final int numb;
}


