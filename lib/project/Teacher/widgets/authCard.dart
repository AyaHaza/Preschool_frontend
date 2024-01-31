import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Controller/Authentication/login_screen.dart';

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {

  final GlobalKey<FormState> formKey = GlobalKey();
  LoginController controller = Get.put(LoginController(),permanent: true);
  bool show=false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Center(
        child: Container(
          height:200.h,
          width: 300.w,
          padding: EdgeInsets.all(16.0),
          color: Colors.transparent,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                    validator: (value) {
                      if (value!.isEmpty || !value.isAlphabetOnly) {
                        return 'Invalid username should be not empty and alphabet!';
                      }
                      return null;
                    },
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
                  SizedBox(height: 10.h,),
                  if (controller.isLoading)
                    CircularProgressIndicator()
                  else
                    ElevatedButton(
                      child: Text('LOGIN'),
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        formKey.currentState!.save();
                        controller.submit(context);
                      },
                    ),
                  Text(controller.msg,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 19.sp),),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
