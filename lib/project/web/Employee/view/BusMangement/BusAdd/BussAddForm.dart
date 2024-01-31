import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/project/Bus_supervisor/widgets/EditPage/DropDown.dart';
import 'package:project/project/web/Employee/Controller/Bus/BusController.dart';

import 'package:project/CONSTANT/colors.dart';
import '../../../Controller/Bus/BusScreenController.dart';

class BusAddForm extends StatefulWidget {
  @override
  _BusAddFormState createState() => _BusAddFormState();
}
class _BusAddFormState extends State<BusAddForm> {
  TextEditingController dateCtl = TextEditingController();
 
  final GlobalKey<FormState> formKey = GlobalKey();

  BusController controllerBus=Get.find();
  @override
  Widget build(BuildContext context) {
    //print('oooooooooo');
    return GetBuilder<BusControllerScreen>(
        builder: (controller) => Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Wrap(
                        children: <Widget>[
                          TextField1(
                            "capacity",
                            TextFormField(
                              decoration: decoration(""),
                              
                              onSaved: (value) {
                               controller.Data!.capacity = value;                              },
                            ),
                          controller.capacityMsg ),
                          TextField1(
                            'number',
                            TextFormField(
                              decoration: decoration(""),
                             
                              onSaved: (value) {
                               controller.Data!.number = value;  
                              },
                            ),
                          controller.numberMsg),
                          TextField1(
                              'bus_supervisor',
                              DropDown(
                                'Select class bus_supervisor',
                                controllerBus.BusesuperV.values
                                    .map((item) => DropdownMenuItem<String>(
                                  value: item.id.toString(),
                                  child: Text(
                                    item.name!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                                    .toList(),
                                    (value) {
                                  controller.Data!.bus_supervisor_id = value;
                                },
                              ),
                              controller.bus_supervisor_idMsg),


                        ],
                      ),
                    ),
                    SizedBox(height: 40.h,),
                    ElevatedButton(
                        child: Text('  Add  '),
                        onPressed: () {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                             formKey.currentState!.save();
                        controller.Store();
                        },
                      ),
                    SizedBox( height: 23.h,),
                    // Text(
                    //  // controller.msg,
                    //   style: TextStyle(
                    //       color: Colors.red,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 19.sp),
                    // ),
                  ],
                ),
              ),
            ));
  }

  InputDecoration decoration(String? text) {
    return InputDecoration(
      border: const OutlineInputBorder(
          borderSide: BorderSide(width: 30, color: Colors.black)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
      ),
    );
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
