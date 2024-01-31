
import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project/CONSTANT/colors.dart';
import 'package:time_picker_widget/time_picker_widget.dart';
import '../../../Controller/Exams/ExamsScreenController.dart';
import '../../../widgets/EditPage/DropDown.dart';
import '../../../widgets/EditPage/date.dart';

class AddExamContent extends StatefulWidget {
  @override
  _AddExamContentState createState() => _AddExamContentState();
}

class _AddExamContentState extends State<AddExamContent> {
    TextEditingController dateCtl = TextEditingController();
    TextEditingController hourCtl = TextEditingController();
      bool isDateSelected = false;
  examsControllerScreen controller = Get.find();
  //File? img;
  var ppuplishDate;
  var statuss;
  var term;
  var type;
  var datee;
  String? nameeeeeeeee;
  String? birthDateInString;
  Uint8List? selectedImageByte;
  var selectedTime;
  final GlobalKey<FormState> formKey = GlobalKey();

  final List<String>  statusExam = [
    'avilable',
    'unavilable',
  ];
    final List<String>  termExam = [
    's1',
    's2',
  ];
    final List<String>  typeExam = [
    'first',
    'second',
    'final'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          centerTitle: true,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 19),
          title:Text("Add Exam") ,
        ),

        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('file:',     style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),),

                      Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(

                          border: Border.all(
                              color: AppColors.iconGray,
                              width: 1.0,
                              style: BorderStyle.solid),
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        //     color: Colors.amber,
                        child: file != null
                            ? InkWell(
                          //  onTap: _selectFile,
                            onTap: createfile,
                            child:Center(child: Text(file!.name))

                          // Image.file(img!)
                        )
                            : InkWell(
                          onTap: createfile,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Text('Add File '),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                    height: 20.h,
                  ),

                  Wrap(
                    children: [
                       SizedBox(
                        height: 10.h,
                      ),


                       TextField1(
                              '  Status ',
                              DropdownButtonFormField2(
                                validator: (value) {
                                  if (value == null || !value.isAlphabetOnly) {
                                    return 'Invalid class rname should be not empty and alphabet!';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  //Add isDense true and zero Padding.

                                  //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.

                                  isDense: true,

                                  contentPadding: EdgeInsets.zero,

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),

                                  //Add more decoration as you want here

                                  //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                ),
                                isExpanded: true,
                                hint: const Text(
                                  'Select Exam Status',
                                  style: TextStyle(fontSize: 14),
                                ),
                                items: statusExam
                                    .map((item) {
                                      print(item);
                                      return DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        );})
                                    .toList(),

                                onChanged: (value) {
                                  print(value);
                                 statuss = value;

                                   print("object%${statuss}");
                                },

                                onSaved: (value) {
                                  print("object%${value}");
                                 statuss = value;
                                },
                                buttonStyleData: const ButtonStyleData(
                                  height: 60,
                                  padding: EdgeInsets.only(left: 20, right: 10),
                                ),
                                iconStyleData: const IconStyleData(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black45,
                                  ),
                                  iconSize: 30,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                    ''  ),

                       TextField1(
                          'Term',
                          DropDown(

                            'Select Exam Term',
                            termExam
                                .map((item) => DropdownMenuItem<String>(

                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                                .toList(),
                                (value) {
                              term = value!;
                            }
                            ,(value){
                              term = value!;
                              print(term);

                            }
                          ),
                          ''),

                       TextField1(
                          'Type',
                          DropDown(
                            'Select Exam Type',
                            typeExam
                                .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                                .toList(),
                                (value) {
                                  print(value);
                              type = value!;
                            },(value){
                              type = value!;
                              print(type);

                            }
                          ),
                          ''),

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

                                 birthDateInString =
                                    "${birthDate.month}/${birthDate.day}/${birthDate.year}";

                                dateCtl.text = birthDateInString!;

                                print(birthDateInString); // 08/14/2019

                                datee =  datePick.toString() ;

                              });
                            }
                          },
                          ),
                          ''
                      ),


                         TextField1(
                          "Hour",
                          date(hourCtl,() async{await showCustomTimePicker(
    context: context,
    // It is a must if you provide selectableTimePredicate
 onFailValidation: (context) => print('Unavailable selection'),
    initialTime: TimeOfDay(hour: 2, minute: 0),
    selectableTimePredicate: (time) =>
      time!.hour >= 0
      ).then((time) =>
    setState(() { selectedTime = '${time!.hour}:${time.minute}';print(selectedTime);hourCtl.text='${time.hour}:${time.minute}';}));

   } ),
                          ''
                      ),


//                        MaterialButton(onPressed: (){
//                          showCustomTimePicker(
//     context: context,
//     // It is a must if you provide selectableTimePredicate
//  onFailValidation: (context) => print('Unavailable selection'),
//     initialTime: TimeOfDay(hour: 2, minute: 0),
//     selectableTimePredicate: (time) =>
//         time!.hour >= 0
//         ).then((time) =>
//     setState(() { selectedTime = '${time!.hour}:${time.minute}';print(selectedTime);}));
//                        },child: Text("hour"),),
                      Container(
                        height: 0,
                        child: Form(
                          key: formKey,
                          child:
                           TextField1(
                            "",
                            TextFormField(
                              decoration: decoration(),

                              onSaved: (value) {
                                ppuplishDate = value;
                              },
                            ),
                            ''),

                        ),
                      ),


                      SizedBox(
                        height: 40.h,
                      ),


                    ],
                  ),
                   MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),),
                        color: Colors.teal.withOpacity(0.4),
                        child: Text('  Add  '),
                        onPressed: ()async {
                              print(statuss);
                          print(file!.path);
                          print(selectedTime);
                          print(term);
                          print(type);
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          formKey.currentState!.save();
                          print(statuss);
                          print(file!.path);
                          print(ppuplishDate);
                          print(term);
                          print(type);
                         await controller.upload(selectedTime,statuss,term,type,birthDateInString,file!.path);


                        },
                      ),

                ],
              ),
            ),
          ),
        ));
  }

// 
 PlatformFile? file;
  void createfile() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles();
    if (resultFile != null) {
       file = resultFile.files.first;
      print(file!.path!);
      setState(() {
       // img = File(file.path!);
      });
    }
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
        width: 190.w,
        child: Padding(
          padding: EdgeInsets.symmetric( horizontal: 6),
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
              SizedBox(height :40.h,child: Text(error,style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.card1),)),
            ],
          ),
        ));
  }

}
