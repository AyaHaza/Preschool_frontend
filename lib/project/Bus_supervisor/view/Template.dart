
import 'package:flutter/material.dart';

import '../widgets/AppBar.dart';

class Template extends StatelessWidget {

  Widget body;
  String title;
  Template({required this.body,required this.title});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 19),
        title:Text(title) ,
      ),
      drawer: AppDrawer(),
      body: SafeArea(child: body),
    );
  }
}
