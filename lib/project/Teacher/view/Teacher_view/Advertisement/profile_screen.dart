import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Controller/Advertisement/apis.dart';
import '../../../Model/chat_user.dart';
class ProfileScreen extends StatefulWidget {
  final ChatUser user;

  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _image;

  @override
  Widget build(BuildContext context) {

    return  GestureDetector(
          // for hiding keyboard
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
              appBar: AppBar(title: const Text('Profile Screen')),
              body: Form(
                  key: _formKey,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:10.h),
                      child: SingleChildScrollView(
                          child: Center(
                            child: Column(
                                children: [
                        // for adding some space
                        SizedBox(width:20.w, height: 30.h),

                        //user profile picture
                        Stack(

                              children: [
                                //profile picture
                                _image != null
                                    ?
                                //local image
                                ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(50),
                                    child: Image.file(File(_image!),
                                        width: 200.w,
                                        height:200.w,
                                        fit: BoxFit.cover)
                                )
                                    :

                                //image from server
                                ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(100),
                                  child: CachedNetworkImage(
                                    width: 200.w,
                                    height:200.w,
                                    fit: BoxFit.cover,
                                    imageUrl: widget.user.image,
                                    errorWidget: (context, url, error) =>
                                    const CircleAvatar(
                                        child: Icon(Icons.person)),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: MaterialButton(
                                    elevation: 1,
                                    onPressed: () {
                                      _showBottomSheet();
                                    },
                                    shape: const CircleBorder(),
                                    color: Colors.white,
                                    child: const Icon(Icons.edit, color: Colors.blue),
                                  ),
                                )
                              ]
                        ),
                                  SizedBox(height: 20.h),
                                  // user email label
                                  Text(widget.user.name,
                                      style: const TextStyle(
                                          color: Colors.black54, fontSize: 16)
                                  ),
                                  // for adding some space
                                  SizedBox(height: 10.h),

                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        shape: const StadiumBorder(),
                                        minimumSize: Size(30.w, 10.h)),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        // APIs.updateUserInfo().then((value) {
                                        //   Dialogs.showSnackbar(
                                        //       context, 'Profile Updated Successfully!');
                                        // });
                                      }
                                    },
                                    icon: const Icon(Icons.edit, size: 28),
                                    label:
                                    const Text('UPDATE', style: TextStyle(fontSize: 16)),
                                  )


                                ]
                            ),
                          )
                      )
                  )
              )
          )

    );
  }
  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (_) {
          return ListView(
            shrinkWrap: true,
            padding:
            EdgeInsets.only(top:10.h, bottom:2.h),
            children: [
              //pick profile picture label
              const Text('Pick Profile Picture',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),

              //for adding some space

              //buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //pick from gallery button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          fixedSize: Size(100.w,200.h)),
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();

                        // Pick an image
                        final XFile? image = await picker.pickImage(
                            source: ImageSource.gallery, imageQuality: 80);
                        if (image != null) {
                          print('Image Path: ${image.path}');
                          setState(() {
                            _image = image.path;
                          });

                          APIs.updateProfilePicture(File(_image!));
                          // for hiding bottom sheet
                          Navigator.pop(context);
                        }
                      },
                      child: Image.asset('images/Gallery.png',fit: BoxFit.fill)),

                  //take picture from camera button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          fixedSize: Size(100.w,200.h)),
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();

                        // Pick an image
                        final XFile? image = await picker.pickImage(
                            source: ImageSource.camera, imageQuality: 80);
                        if (image != null) {
                          print('Image Path: ${image.path}');
                          setState(() {
                            _image = image.path;
                          });

                          APIs.updateProfilePicture(File(_image!));
                          // for hiding bottom sheet
                          Navigator.pop(context);
                        }
                      },
                      child: Image.asset('images/camera.png',fit: BoxFit.cover,)),
                ],
              )
            ],
          );
        });
  }
}