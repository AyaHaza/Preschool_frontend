

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

Widget DropDown(String hint,List<DropdownMenuItem<String>> items,Function(String?)? onSaved){
  return DropdownButtonFormField2(
validator:  (value) => value == null
    ? 'Please fill this ' : null,
    decoration: InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.zero,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    isExpanded: true,
    hint:  Text(
      hint,
      style: TextStyle(fontSize: 14),
    ),
    items: items,
    onChanged: (value) {
      //Do something when changing the item if you want.
    },
    onSaved: onSaved,
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
  );

}