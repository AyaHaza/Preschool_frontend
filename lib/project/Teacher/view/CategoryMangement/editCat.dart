// import 'dart:convert';
//
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import 'package:http/http.dart'as http;
// import 'dart:io';
// import 'package:pre_school_project/project/mobile/Controller/Categories/categoryController.dart';
//
// import '../../../web/widgets/Dialogs/ErrorDialog.dart';
// import 'AllCategory/AllCategoriesContent.dart';
// import 'AllCategory/AllCategory.dart';
// class AeditCat extends StatefulWidget {
//   int? index;
//   int ?id;
//   AeditCat({ this.index, this.id});
//   // static const routeName = '/EditCat';
//
//   @override
//   _AeditCatState createState() => _AeditCatState();
// }
// class _AeditCatState extends State<AeditCat> {
//
//       CatController controller = Get.find();
// File? img;
//
//   final GlobalKey<FormState> formKey = GlobalKey();
//
//     void createfile()async{
//       FilePickerResult? resultFile=await FilePicker.platform.pickFiles(
//         type: FileType.any,
//         allowMultiple: true,
//
//       );
//       if(resultFile !=null){
//         PlatformFile file=resultFile.files.first;
//         print(file.name);
//         print(file.bytes);
//         print(file.extension);
//         print(file.path);
// setState(() {
//   img=File(file.path!);
// });
//
//   //      controller.Data!.img = await dio.MultipartFile.fromFile(file.path!,filename: file.name);
//
//
//
//       }
//
//     }
//
//   @override
//   Widget build(BuildContext context) {
//
//     print('oooooooooo'A);
//     return SafeArea(
//       child:Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 175, 76, 150),
//           title: Text('Edit Category'),
//         ),
//
//         body:     Center(
//           child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Form(
//                       key: formKey,
//                       child: Row(
//                         children: <Widget>[
//
//
//                             Container(
//                               width: 150,
//                               child: TextFormField(
//                                             decoration: InputDecoration(
//                                               hintText: controller.AllCateg.values.elementAt(widget.index).name,
//                                               focusColor: Color(0xffb14d98)
//                                             ),
//
//                                 onSaved: (value) {
//                                                          name = value;                              },
//                               ),
//                             ),
//
//                       //   Expanded(child: IconButton(onPressed: createfile, icon: Icon(Icons.add_a_photo))),
//               SizedBox(width: 10,),
//                 Expanded(
//                   child: Container(
//                         width: 200,
//                         height: 200,
//                           decoration: BoxDecoration(
//                        boxShadow: const [
//                                BoxShadow(
//                               color: Color.fromRGBO(241, 208, 233, 1),
//                               offset: Offset(
//                                 0.0,
//                                 0.0,
//                               ),
//                               blurRadius: 1.0,
//                               spreadRadius: 2.0,
//                             ), //BoxShadow
//
//                        ],
//                      border: Border.all(
//                               color: Color.fromARGB(255, 175, 76, 150),
//                               width: 2.0,
//                               style: BorderStyle.solid),
//                        color:Color.fromARGB(255, 255, 255, 255),
//                        borderRadius: BorderRadius.circular(15),
//                      ),
//                    //     color: Colors.amber,
//                         child:    img !=null?InkWell(onTap: createfile,
//                         child:  Image.file(img!)
//                         )
//
//                        :InkWell(
//                           onTap:createfile ,
//                           child:   Image.network('http://192.168.1.103:80/'+'${controller.AllCateg.values.elementAt(widget.index).img}',),
//
//                         ),
//                       ),
//                 ),
//
//
//                           // TextField1(
//                           //   'Image',
//                           //   TextFormField(
//                           //     decoration: decoration(""),
//
//                           //     onSaved: (value) {
//                           //     createfile();
//                           //     },
//                           //   ),
//                           // ),
//                          ],
//                       ),
//                     ),
//                     SizedBox(height: 40.h,),
//                     ElevatedButton(
//
//
//
//                         child:  Text('  Edit  '),
//                         onPressed: () {
//                           // print(controller.Data!.name);
//                           // print(controller.Data!.img);
//                           if (!formKey.currentState!.validate()) {
//                             return;
//                           }
//                              formKey.currentState!.save();
//                        upload(widget.id);
//                         },
//                       ),
//                     SizedBox( height: 23.h,),
//                     // Text(
//                     //  // controller.msg,
//                     //   style: TextStyle(
//                     //       color: Colors.red,
//                     //       fontWeight: FontWeight.bold,
//                     //       fontSize: 19.sp),
//                     // ),
//                   ],
//                 ),
//               ),
//             ),
//         )),
//
//       );
//   }
//
//   var name;
//
//   Future<void> upload(id) async {
//
//
//
//
//     var url = Uri.parse('http://192.168.1.103:80/api/categories/${id}');
// print(widget.id);
// try{
//
// var headers = {
//         'Content-Type': 'application/json',
//         'Authorization': "Bearer 8|ESCVmgn91rFWC9BKueSVT4wfI4XTjPVOELYapNTt",
//
//       };
//     var response = await http.MultipartRequest('POST', url);
//     response.fields['name'] = name;
//   response.headers.addAll(headers);
//
//
//     var pic = await http.MultipartFile.fromPath('img', img!.path);
//     response.files.add(pic);
//
//     var responsed = await response.send();
//     var r = await http.Response.fromStream(responsed);
//     var rr = json.decode(json.encode(r.body));
//     print(responsed.statusCode);
//
//     print(rr);
//     Get.offAndToNamed(AllCategory.routeName);
//
//
//
//   }
//   catch (e) {
//       print(e);
//     Dialogs.Error("ERROR occure ! please Try Again!  <$e>");}
//
//
// }
// }import 'dart:convert';
//
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import 'package:http/http.dart'as http;
// import 'dart:io';
// import 'package:pre_school_project/project/mobile/Controller/Categories/categoryController.dart';
//
// import '../../../web/widgets/Dialogs/ErrorDialog.dart';
// import 'AllCategory/AllCategoriesContent.dart';
// import 'AllCategory/AllCategory.dart';
// class AeditCat extends StatefulWidget {
//   int index;
//   int id;
//   AeditCat({required this.index,required this.id});
//    static const routeName = '/EditCat';
//
//   @override
//   _AeditCatState createState() => _AeditCatState();
// }
// class _AeditCatState extends State<AeditCat> {
//
//       CatController controller = Get.find();
// File? img;
//
//   final GlobalKey<FormState> formKey = GlobalKey();
//
//     void createfile()async{
//       FilePickerResult? resultFile=await FilePicker.platform.pickFiles(
//         type: FileType.any,
//         allowMultiple: true,
//
//       );
//       if(resultFile !=null){
//         PlatformFile file=resultFile.files.first;
//         print(file.name);
//         print(file.bytes);
//         print(file.extension);
//         print(file.path);
// setState(() {
//   img=File(file.path!);
// });
//
//   //      controller.Data!.img = await dio.MultipartFile.fromFile(file.path!,filename: file.name);
//
//
//
//       }
//
//     }
//
//   @override
//   Widget build(BuildContext context) {
//
//     print('oooooooooo');
//     return SafeArea(
//       child:Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 175, 76, 150),
//           title: Text('Edit Category'),
//         ),
//
//         body:     Center(
//           child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Form(
//                       key: formKey,
//                       child: Row(
//                         children: <Widget>[
//
//
//                             Container(
//                               width: 150,
//                               child: TextFormField(
//                                             decoration: InputDecoration(
//                                               hintText: controller.AllCateg.values.elementAt(widget.index).name,
//                                               focusColor: Color(0xffb14d98)
//                                             ),
//
//                                 onSaved: (value) {
//                                                          name = value;                              },
//                               ),
//                             ),
//
//                       //   Expanded(child: IconButton(onPressed: createfile, icon: Icon(Icons.add_a_photo))),
//               SizedBox(width: 10,),
//                 Expanded(
//                   child: Container(
//                         width: 200,
//                         height: 200,
//                           decoration: BoxDecoration(
//                        boxShadow: const [
//                                BoxShadow(
//                               color: Color.fromRGBO(241, 208, 233, 1),
//                               offset: Offset(
//                                 0.0,
//                                 0.0,
//                               ),
//                               blurRadius: 1.0,
//                               spreadRadius: 2.0,
//                             ), //BoxShadow
//
//                        ],
//                      border: Border.all(
//                               color: Color.fromARGB(255, 175, 76, 150),
//                               width: 2.0,
//                               style: BorderStyle.solid),
//                        color:Color.fromARGB(255, 255, 255, 255),
//                        borderRadius: BorderRadius.circular(15),
//                      ),
//                    //     color: Colors.amber,
//                         child:    img !=null?InkWell(onTap: createfile,
//                         child:  Image.file(img!)
//                         )
//
//                        :InkWell(
//                           onTap:createfile ,
//                           child:   Image.network('http://192.168.1.103:80/'+'${controller.AllCateg.values.elementAt(widget.index).img}',),
//
//                         ),
//                       ),
//                 ),
//
//
//                           // TextField1(
//                           //   'Image',
//                           //   TextFormField(
//                           //     decoration: decoration(""),
//
//                           //     onSaved: (value) {
//                           //     createfile();
//                           //     },
//                           //   ),
//                           // ),
//                          ],
//                       ),
//                     ),
//                     SizedBox(height: 40.h,),
//                     ElevatedButton(
//
//
//
//                         child:  Text('  Edit  '),
//                         onPressed: () {
//                           // print(controller.Data!.name);
//                           // print(controller.Data!.img);
//                           if (!formKey.currentState!.validate()) {
//                             return;
//                           }
//                              formKey.currentState!.save();
//                        upload(widget.id);
//                         },
//                       ),
//                     SizedBox( height: 23.h,),
//                     // Text(
//                     //  // controller.msg,
//                     //   style: TextStyle(
//                     //       color: Colors.red,
//                     //       fontWeight: FontWeight.bold,
//                     //       fontSize: 19.sp),
//                     // ),
//                   ],
//                 ),
//               ),
//             ),
//         )),
//
//       );
//   }
//
//   var name;
//
//   Future<void> upload(id) async {
//
//
//
//
//     var url = Uri.parse('http://192.168.1.103:80/api/categories/${id}');
// print(widget.id);
// try{
//
// var headers = {
//         'Content-Type': 'application/json',
//         'Authorization': "Bearer 8|ESCVmgn91rFWC9BKueSVT4wfI4XTjPVOELYapNTt",
//
//       };
//     var response = await http.MultipartRequest('POST', url);
//     response.fields['name'] = name;
//   response.headers.addAll(headers);
//
//
//     var pic = await http.MultipartFile.fromPath('img', img!.path);
//     response.files.add(pic);
//
//     var responsed = await response.send();
//     var r = await http.Response.fromStream(responsed);
//     var rr = json.decode(json.encode(r.body));
//     print(responsed.statusCode);
//
//     print(rr);
//     Get.offAndToNamed(AllCategory.routeName);
//
//
//
//   }
//   catch (e) {
//       print(e);
//     Dialogs.Error("ERROR occure ! please Try Again!  <$e>");}
//
//
// }
// }