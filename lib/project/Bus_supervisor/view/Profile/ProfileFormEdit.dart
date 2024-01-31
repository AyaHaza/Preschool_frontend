import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../CONSTANT/responsive.dart';
import '../../Controller/Authentication/AuthController.dart';
import '../../Controller/Authentication/Profile_screen.dart';
import '../../widgets/EditPage/InputDecoration.dart';
import '../../widgets/EditPage/TextField.dart';


class ProfileEditForm extends StatefulWidget {
  @override
  State<ProfileEditForm> createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {
  @override
  final _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var show1=true;
  var show2=true;
  var show3=true;

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController(), permanent: false);
    return
      GetBuilder<ProfileControllerScreen>(
        init: ProfileControllerScreen(),
        builder: (controller) =>
            Center(
                child: SingleChildScrollView(
                  child: Column(
                      children:[ Form(
                          key: formKey,
                          child: GetBuilder<AuthController>(
                              builder: (controller1) =>
                                  Wrap(
                                      direction: Axis.vertical ,
                                      children:[
                                        TextField1(
                                            "Name",
                                            TextFormField(
                                              decoration:
                                              InputDecoration(
                                                  errorMaxLines: 4
                                              ),

                                              initialValue:controller1.user?.name!=null?controller1.user?.name!.toString():'',
                                              validator: (value) {
                                                if (value != null && !value.isAlphabetOnly) {
                                                  return 'Invalid name should be alphabet!';
                                                }
                                                return null;
                                              },
                                              onSaved: (value) {
                                                controller.EditedData!.name = value;
                                              },
                                            ),
                                            controller.nameMsg
                                        ),

                                        TextField1(
                                            "Password",
                                            TextFormField(

                                                obscureText: show1,
                                                controller: _passwordController,
                                                validator: (value) {
                                                  if (value!.isNotEmpty && value.length < 10) {
                                                    return 'Password is too short!';
                                                  }
                                                },
                                                onSaved: (value) {
                                                  if(value!.isEmpty) {
                                                    controller.EditedData!.newPassword=null;
                                                  } else {
                                                    controller.EditedData!.newPassword=value!;
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                    errorMaxLines: 3,
                                                    suffix: IconButton(onPressed: (){
                                                      setState(() {
                                                        if(show1){
                                                          show1 = false;
                                                        }else{
                                                          show1 = true;
                                                        }
                                                      });
                                                    }, icon: Icon(Icons.remove_red_eye ,color: show1 == true ? Colors.pink :Colors.black,size: 20,))

                                                )
                                            ),
                                            controller.PasswordMsg
                                        ),    TextField1(
                                            "Current Password",
                                            TextFormField(
                                                obscureText: show2,
                                                validator: (value) {

                                                  if (value!.isEmpty && _passwordController.text.isNotEmpty||  value.length < 10 && _passwordController.text.isNotEmpty) {
                                                    return _passwordController.text;
                                                  }
                                                },
                                                onSaved: (value) {
                                                  controller.EditedData!.currentPassword=value!;
                                                },
                                                decoration: InputDecoration(
                                                    suffix: IconButton(onPressed: (){
                                                      setState(() {
                                                        if(show2){
                                                          show2 = false;
                                                        }else{
                                                          show2 = true;
                                                        }
                                                      });
                                                    }, icon: Icon(Icons.remove_red_eye ,color: show2 == true ? Colors.pink :Colors.black,size: 20,))

                                                )
                                            ),
                                            controller.CurrentPasswordMsg
                                        ),
                                        TextField1(
                                            "Confirm Password",
                                            TextFormField(
                                                obscureText: show3,
                                                validator: (value) {
                                                  if (value != _passwordController.text) {
                                                    return 'Passwords do not match!';
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                    suffix: IconButton(onPressed: (){
                                                      setState(() {
                                                        if(show3){
                                                          show3 = false;
                                                        }else{
                                                          show3 = true;
                                                        }
                                                      });
                                                    }, icon: Icon(Icons.remove_red_eye ,color: show3 == true ? Colors.pink :Colors.black,size: 20,))

                                                )
                                            ),
                                            ""
                                        ),
                                      ]
                                  )
                          )
                      ),
                        if (controller.isLoading)
                          CircularProgressIndicator()
                        else
                          MaterialButton(
                            color: Colors.grey.shade400,
                            child: Text('   Edit    '),
                            onPressed: () {
                              if (!formKey.currentState!.validate()) {
                                return;
                              }
                              formKey.currentState!.save();
                              controller.Edit();
                            },
                          ),


                      ]
                  ),
                )
            ),
      );
  }
}
