import 'package:flutter/material.dart';
import 'EditCatContent.dart';


class EditCategory extends StatelessWidget {
  int ?index;
  int ?id;
  String?nameImg;
  EditCategory({ this.index, this.id,this.nameImg});
  static const routeName = '/AllCat/Edit';
  @override
  Widget build(BuildContext context) {
    return  AeditCat(index: index, id:id!,nameImg:nameImg);
  }
}
