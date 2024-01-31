import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../CONSTANT/colors.dart';
import '../../../../../../CONSTANT/responsive.dart';
import '../../Controller/Config/ConfigController.dart';
import '../../Controller/Config/Config_Screen.dart';
import '../../widgets/EditPage/date.dart';

class ConfigForm extends StatefulWidget {

  @override
  State<ConfigForm> createState() => _ConfigFormState();
}

class _ConfigFormState extends State<ConfigForm> {
  TextEditingController dateCtl = TextEditingController();

  bool isDateSelected = false;

  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return GetBuilder<ConfigControllerScreen>(

        builder: (controller) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: formKey,
                child: Wrap(
                  direction:   (Responsive.isMobile(context)) ?Axis.vertical : Axis.horizontal,
                  children: <Widget>[
                    TextField1(
                      "Amount",
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
                          controller.Data!.amount = int.parse(value!);
                        },
                      ),
                      controller.AmountMsg,
                    ),
                    TextField1(
                      "Date",
                    date(dateCtl,() async{
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
                              "${birthDate.month}/${birthDate.day}/${birthDate.year}";

                          dateCtl.text = birthDateInString;

                          print(birthDateInString); // 08/14/2019

                          controller.Data!.date =  datePick ;

                        });
                      }
                    },
                    ),
                      controller.DateMsg
                    )
                  ],
                ),
              ),
              SizedBox(height: 40.h,),
              if (controller.isLoading)
                CircularProgressIndicator()
              else
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
              SizedBox( height: 23.h,),
            ],
          ),
        ));
  }

  InputDecoration decoration() {
    return InputDecoration(
      border: const OutlineInputBorder(
          borderSide: BorderSide(width: 30, color: Colors.black)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
      ),
    );
  }

  Widget TextField1(String label, Widget text ,String error) {
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
              SizedBox(height :50.h,child: text),
              SizedBox(height :40.h,child: Text(error,style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.card4),)),
            ],
          ),
        ));
  }
}
