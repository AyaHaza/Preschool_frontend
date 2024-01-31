import 'package:flutter/material.dart';

Widget date(TextEditingController dateCtl, Function()? ontap ){
  return      TextFormField(
    controller: dateCtl,
    decoration: InputDecoration(
      border: OutlineInputBorder(
          borderSide: BorderSide(
              width: 30, color: Colors.black)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.indigoAccent,
      ),
      // labelText: "Date of birth",
    ),
    ),
    onTap: ontap,
  );

}