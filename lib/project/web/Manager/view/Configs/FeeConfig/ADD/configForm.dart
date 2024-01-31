import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../CONSTANT/responsive.dart';
import '../../../../Controller/Config/FeeConfigController.dart';
import '../../../../Controller/Config/Fee_Config_screen.dart';
import '../../../../widgets/EditPage/InputDecoration.dart';
import '../../../../widgets/EditPage/TextField.dart';
import '../../../../widgets/EditPage/date.dart';


class FeeConfigForm extends StatefulWidget {

  @override
  State<FeeConfigForm> createState() => _FeeConfigFormState();
}

class _FeeConfigFormState extends State<FeeConfigForm> {
  TextEditingController dateCtl = TextEditingController();
  FeeConfigController controller1  =Get.find();

  bool isDateSelected = false;
  final  formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: formKey,
                child: GetBuilder<FeeConfigControllerScreen>(
        builder: (controller) => Wrap(
                  direction:   (Responsive.isMobile(context)) ?Axis.vertical : Axis.horizontal,
                  children: <Widget>[
                    TextField1(
                        "year",
                        date(dateCtl,() async{
                          DateTime date = DateTime(1900);

                          FocusScope.of(context)
                              .requestFocus(new FocusNode());

                          final datePick = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100)
                          );

                          DateTime birthDate = DateTime.now();

                          if (datePick != null && datePick != birthDate) {
                            setState(() {
                              birthDate = datePick;

                              isDateSelected = true;

                              // instance of DateTime

                              // put it here
                              String birthDateInString =
                                  "${birthDate.month}/${birthDate.day}/${birthDate.year}";

                              dateCtl.text = birthDateInString;

                              print(birthDateInString); // 08/14/2019

                              controller.FeeData!.year =  datePick.year.toString() ;

                            });
                          }
                        },
                        ),
                        controller.Year!
                    ),
                    TextField1(
                      "School fees",
                      TextFormField(
                        decoration: decoration(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value==null || !value.isNumericOnly) {
                            return 'Invalid Amount should be not empty and numeric!';
                          }
                          return null;
                        },
                        onSaved: (value) {
                           controller.FeeData!.studyFees =value;
                        },
                      ),
                      controller.study_fees!,
                    ),
                    TextField1(
                      "bus fees",
                      TextFormField(
                        decoration: decoration(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value==null || !value.isNumericOnly) {
                            return 'Invalid Amount should be not empty and numeric!';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controller.FeeData!.busFees =value;
                        },
                      ),
                      controller.bus_fees!,
                    ),
                    TextField1(
                      "bus discount",
                      TextFormField(
                        decoration: decoration(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value==null || !value.isNumericOnly) {
                            return 'Invalid Amount should be not empty and numeric!';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controller.FeeData!.discountBus= int.parse(value!);
                        },
                      ),
                      controller.discount_bus!,
                    ),
                    TextField1(
                      "discount without_bus",
                      TextFormField(
                        decoration: decoration(),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value==null || !value.isNumericOnly) {
                            return 'Invalid Amount should be not empty and numeric!';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controller.FeeData!.discountWithoutBus = int.parse(value!);
                        },
                      ),
                      controller.discount_without_bus!,
                    ),
                  ],
                ),
              ),
              ),
        SizedBox(height: 40.h,),

        GetBuilder<FeeConfigControllerScreen>(
            builder: (controller) =>
               controller.isLoading ?
                CircularProgressIndicator()
              :
                ElevatedButton(
                  child: Text('ADD'),
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    formKey.currentState!.save();
                    controller.Store();
                  },
                ),
    ),
              SizedBox( height: 23.h,),
            ],
          ),
        );
  }


}
