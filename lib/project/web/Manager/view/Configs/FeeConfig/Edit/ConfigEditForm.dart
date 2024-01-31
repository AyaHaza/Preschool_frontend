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

class YearConfigFormEdit extends StatefulWidget {
  int id;

  YearConfigFormEdit({required this.id});

  @override
  State<YearConfigFormEdit> createState() => _YearConfigFormEditState();
}

class _YearConfigFormEditState extends State<YearConfigFormEdit> {
  FeeConfigController cont = Get.find();
  TextEditingController dateCtl = TextEditingController();

  bool isDateSelected = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (!isDateSelected) {
      DateTime date =
          DateTime(int.parse(cont.FeeConfigs[super.widget.id]!.year!));
      dateCtl.text = "${date.year}";
    }

    return SingleChildScrollView(
        child: GetBuilder<FeeConfigControllerScreen>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GetBuilder<FeeConfigController>(
            builder: (controller1) => Form(
              key: formKey,
              child: Wrap(
                direction: (Responsive.isMobile(context))
                    ? Axis.vertical
                    : Axis.horizontal,
                children: <Widget>[
                  TextField1(
                      "Year",
                      date(
                        dateCtl,
                        () async {
                          //DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(new FocusNode());

                          final datePick = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));

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

                              dateCtl.text=datePick.year.toString();

                            });
                          }
                        },
                      ),
                      controller.Year!),
                  TextField1(
                    "School fees",
                    TextFormField(
                      initialValue: controller1
                          .FeeConfigs[super.widget.id]!.studyFees
                          .toString(),
                      decoration: decoration(),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || !value.isNumericOnly) {
                          return 'Invalid Amount should be not empty and numeric!';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        controller.EditedFeeData!.studyFees = value;
                      },
                    ),
                    controller.study_fees!,
                  ),
                  TextField1(
                    "bus fees",
                    TextFormField(
                      initialValue: controller1
                          .FeeConfigs[super.widget.id]!.busFees
                          .toString(),
                      decoration: decoration(),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || !value.isNumericOnly) {
                          return 'Invalid Amount should be not empty and numeric!';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        controller.EditedFeeData!.busFees = value;
                      },
                    ),
                    controller.bus_fees!,
                  ),
                  TextField1(
                    "bus discount",
                    TextFormField(
                      initialValue: controller1
                          .FeeConfigs[super.widget.id]!.discountBus
                          .toString(),
                      decoration: decoration(),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || !value.isNumericOnly) {
                          return 'Invalid Amount should be not empty and numeric!';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        controller.EditedFeeData!.discountBus = int.parse(value!);
                      },
                    ),
                    controller.discount_bus!,
                  ),
                  TextField1(
                    "discount without_bus",
                    TextFormField(
                      initialValue: controller1
                          .FeeConfigs[super.widget.id]!.discountWithoutBus
                          .toString(),
                      decoration: decoration(),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || !value.isNumericOnly) {
                          return 'Invalid Amount should be not empty and numeric!';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        controller.EditedFeeData!.discountWithoutBus =int.parse(value!);
                      },
                    ),
                    controller.discount_without_bus!,
                  ),
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
                controller.EditedFeeData!.year=  dateCtl.text;
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
}
