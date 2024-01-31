import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Controller/Authentication/login_screen.dart';

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  LoginController controller = Get.find();

  bool show=true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (controller) => Center(
              child: Container(
                height: 700.h,
                width: 400.w,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                color: Colors.transparent,
                child: Form(
                  key: formKey,
                  child: ListView(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Username',
                          ),

                          validator: (value) {
                            if (value!.isEmpty || !value.isAlphabetOnly) {
                              return 'Invalid username should be not empty and alphabet!';
                            }
                          },
                          onTap: () => controller.updateTap(true),
                          onTapOutside: (event) =>
                              controller.updateTap(false),
                          onSaved: (value) {
                            controller.authData["name"] = value!;
                          },
                        ),

                        TextFormField(
                          obscureText: show,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 10) {
                              return 'Password is too short!';
                            }
                          },
                          onSaved: (value) {
                            controller.authData["password"] = value!;
                          },
                          onTap: () => controller.updateTap(true),
                          onTapOutside: (event) =>
                              controller.updateTap(false),

                          decoration: InputDecoration(
                              hintText: "Enter Password Here",
                              labelText: "Password",
                              suffix: IconButton(onPressed: (){
                                setState(() {
                                  if(show){
                                    show = false;
                                  }else{
                                    show = true;
                                  }
                                });
                              }, icon: Icon(Icons.remove_red_eye ,color: show == true ? Colors.pink :Colors.black,size: 20,))

                          ),

                        ),
                        SizedBox(height: 40.h,),
                        if (controller.isLoading)
                          SizedBox(width :30.w,height:40.h,child: Center(child: CircularProgressIndicator()))
                        else
                        Container(
                          height:50.h ,
                          width: 2.w,
                          child: ElevatedButton(
                            child: Text('LOGIN'),
                            onPressed: () {
                              if (!formKey.currentState!.validate()) {
                                return;
                              }
                              formKey.currentState!.save();
                              controller.submit(context);
                            },
                          ),
                        ),
                        SizedBox(height: 23.h,),
                        Text(controller.msg,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 19.sp),),
                      ],
                    ),
                  ),
                ),

            )
    );
  }
}
