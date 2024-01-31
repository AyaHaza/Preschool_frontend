import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/CONSTANT/colors.dart';
import '../../../Controller/Bus/BusController.dart';
import '../../../Controller/Bus/BusScreenController.dart';
import '../../../widgets/EditPage/InputDecoration.dart';



class BusContentEdit extends StatefulWidget {
  int id;

  BusContentEdit({required this.id});

  @override
  State<BusContentEdit> createState() => _BusContentEditState();
}

class _BusContentEditState extends State<BusContentEdit> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<BusControllerScreen>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GetBuilder<BusController>(
            builder: (controller1) => Form(
              key: formKey,
              child: Wrap(
                children: <Widget>[
                  TextField1(
                      "capacity",
                      TextFormField(
                        initialValue:
                            controller1.Buses[super.widget.id]!.capacity,
                        decoration: decoration(),
                     
                        onSaved: (value) {
                          controller.EditedData!.capacity = value;
                        },
                      ),
                      controller.capacityMsg),
                 TextField1(
                      "number",
                      TextFormField(
                        initialValue:
                            controller1.Buses[super.widget.id]!.number,
                        decoration: decoration(),
                     
                        onSaved: (value) {
                          controller.EditedData!.number = value;
                        },
                      ),
                      controller.numberMsg),
                 
                  TextField1(
                      "bus_supervisor_id",
                      TextFormField(
                        initialValue:
                            controller1.Buses[super.widget.id]!.bus_supervisor_id,
                        decoration: decoration(),
                     
                        onSaved: (value) {
                          controller.EditedData!.bus_supervisor_id = value;
                        },
                      ),
                      controller.bus_supervisor_idMsg),
                 
                
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          if (controller.isLoading)
            CircularProgressIndicator()
          else
            ElevatedButton(
              child: Text('   Edit    '),
              onPressed: () {
                if (!formKey.currentState!.validate()) {
                  return;
                }
                formKey.currentState!.save();
                controller.Edit(super.widget.id);
              },
            ),
          SizedBox(
            height: 23.h,
          ),
        ],
      ),
    ));
  }
    Widget TextField1(String label, Widget text, String? error) {
    return SizedBox(
        width: 200.w,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              SizedBox(height: 50.h, child: text),
              SizedBox(
                  height: 40.h,
                  child: 
                  (error!='')?
                  Text(
                    error!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColors.card1),
                  ):Text('')),
            ],
          ),
        ));
  }

}
