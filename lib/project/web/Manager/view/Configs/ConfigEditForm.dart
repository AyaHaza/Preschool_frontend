import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../CONSTANT/responsive.dart';
import '../../Controller/Config/Config_Screen.dart';
import '../../Controller/Config/ConfigController.dart';
import '../../widgets/EditPage/InputDecoration.dart';
import '../../widgets/EditPage/TextField.dart';
import '../../widgets/EditPage/date.dart';


class ConfigFormEdit extends StatefulWidget {
  int id;
  ConfigFormEdit({required this.id});
  @override
  State<ConfigFormEdit> createState() => _ConfigFormEditState();
}

class _ConfigFormEditState extends State<ConfigFormEdit> {
 ConfigController config =Get.find();
  TextEditingController dateCtl = TextEditingController();
  bool isDateSelected = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   if(!isDateSelected) {
     DateTime date =config.Configs[super.widget.id]!.date!;
     dateCtl.text= "${date.month}/${date.day}/${date.year}";
   }
    return SingleChildScrollView(
        child: GetBuilder<ConfigControllerScreen>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GetBuilder<ConfigController>(
                builder: (controller1) =>Form(
                  key: formKey,
                  child: Wrap(
                 direction:   (Responsive.isMobile(context)) ?Axis.vertical : Axis.horizontal,
                    children: <Widget>[
                      TextField1(
                        "Amount",
                        TextFormField(
                          initialValue: controller1.Configs[super.widget.id]!.amount.toString(),
                          decoration: decoration(),
                          validator: (value) {
                            if (value != null && !value.isNumericOnly) {
                              return 'Invalid Amount should be numeric!';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            controller.EditedData!.amount = int.parse(value!);
                          },
                        ),
                        controller.AmountMsg,
                      ),
                      TextField1(
                          "Date",
                          date(dateCtl,() async {
                            //DateTime date = DateTime(1900);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());

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
                                    "${birthDate.month}/${birthDate.day}/${birthDate
                                    .year}";

                                dateCtl.text = birthDateInString;

                                controller.EditedData!.date= datePick;
                              });
                            }
                          },
                        ),
                          controller.DateMsg
                      )
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
        )
    );
  }

}
