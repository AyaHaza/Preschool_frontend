import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/Configs/ConfigAdd.dart';
import '../view/Configs/ConfigPage.dart';
import '../view/Configs/FeeConfig/ADD/FeeConfigAdd.dart';
import '../view/Configs/FeeConfig/Show/FeeShow.dart';
import '../view/Home/HomePage.dart';
import '../view/RegistryMangement/RegisteryAll/RegisteryAll.dart';
import '../view/Report/ViewPage.dart';
import '../view/StudentMangement/StudentAll/StudentAll.dart';

class APPDrawer extends StatefulWidget {
  Widget Content;

  APPDrawer({required this.Content});

  @override
  State<APPDrawer> createState() => _APPDrawerState();
}

class _APPDrawerState extends State<APPDrawer> {
  NavigationRailLabelType labelType = NavigationRailLabelType.all;

  int selectedIndex = Get.arguments == null ? 0 : Get.arguments[0];
  bool showLeading = false;

  bool showTrailing = false;

  double groupAligment = -1.0;

  // final List<Widget> _items = [
  @override
  Widget build(BuildContext context) {
    int x = 800;
    double fontsize = 15;
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width > x ? 300 : 100,
          child: ListView(
            children: [
              ListTile(
                tileColor: selectedIndex == 0
                    ? Colors.blueAccent.withOpacity(0.4)
                    : Colors.transparent,
                hoverColor: Colors.white,
                leading: Icon(Icons.home_filled),
                title: MediaQuery.of(context).size.width < x
                    ? Text("")
                    : Text(
                        'Home',
                        style: TextStyle(fontSize: fontsize),
                      ),
                onTap: () {
                  Get.toNamed(HomePage.routeName, arguments: [0]);
                },
              ),


              ListTile(
                tileColor: selectedIndex == 3
                    ? Colors.blueAccent.withOpacity(0.4)
                    : Colors.transparent,
                hoverColor: Colors.white,
                leading: Icon(Icons.file_copy_rounded),
                title: MediaQuery.of(context).size.width < x
                    ? Text("")
                    : Text('Reports Management',
                    style: TextStyle(fontSize: fontsize)),
                onTap: () {
                  Get.toNamed(ReportView.routeName, arguments: [3]);
                },
              ),


              ExpansionTile(
                leading: Icon(Icons.settings),
                title: MediaQuery.of(context).size.width < x
                    ? Text("")
                    : Text('Fee Config Management',
                    style: TextStyle(fontSize: fontsize)),
                children: [
                  ListTile(
                    tileColor: selectedIndex == 7
                        ? Colors.blueAccent.withOpacity(0.4)
                        : Colors.transparent,
                    hoverColor: Colors.white,
                    leading: Icon(Icons.add_box_outlined),
                    title: MediaQuery.of(context).size.width < x
                        ? Text("")
                        : Text('Configuration ADD',
                        style: TextStyle(fontSize: fontsize)),
                    onTap: () {
                      Get.toNamed(ConfigAdd.routeName, arguments: [7]);
                    },
                  ),
                  ListTile(
                    tileColor: selectedIndex == 1000
                        ? Colors.blueAccent.withOpacity(0.4)
                        : Colors.transparent,
                    hoverColor: Colors.white,
                    leading: Icon(Icons.add_box_outlined),
                    title: MediaQuery.of(context).size.width < x
                        ? Text("")
                        : Text('Year Fee Configuration ADD',
                        style: TextStyle(fontSize: fontsize)),
                    onTap: () {
                      Get.toNamed(FeeConfigAdd.routeName, arguments: [1000]);
                    },
                  ),
                  ListTile(
                    tileColor: selectedIndex == 8
                        ? Colors.blueAccent.withOpacity(0.4)
                        : Colors.transparent,
                    hoverColor: Colors.white,
                    leading: Icon(Icons.edit_note_rounded),
                    title: MediaQuery.of(context).size.width < x
                        ? Text("")
                        : Text('Configuration Management',
                        style: TextStyle(fontSize: fontsize)),
                    onTap: () {
                      Get.toNamed(ConfigManagemet.routeName, arguments: [8]);
                    },
                  ),
                  ListTile(
                    tileColor: selectedIndex == 10001
                        ? Colors.blueAccent.withOpacity(0.4)
                        : Colors.transparent,
                    hoverColor: Colors.white,
                    leading: Icon(Icons.edit_note_rounded),
                    title: MediaQuery.of(context).size.width < x
                        ? Text("")
                        : Text('Year Fee Configuration Management',
                        style: TextStyle(fontSize: fontsize)),
                    onTap: () {
                      Get.toNamed(YearFeeConfigShow.routeName, arguments: [10001]);
                    },
                  ),

                ],
              ),

              ListTile(
                tileColor: selectedIndex == 11
                    ? Colors.blueAccent.withOpacity(0.4)
                    : Colors.transparent,
                hoverColor: Colors.white,
                leading: Icon(Icons.edit_note_rounded),
                title: MediaQuery.of(context).size.width < x
                    ? Text("")
                    : Text('Registry Management',
                    style: TextStyle(fontSize: fontsize)),
                onTap: () {
                  Get.toNamed(RegisteryManagemet.routeName,
                      arguments: [11]);
                },
              ),

                  ListTile(
                    tileColor: selectedIndex == 13
                        ? Colors.blueAccent.withOpacity(0.4)
                        : Colors.transparent,
                    hoverColor: Colors.white,
                    leading: Icon(Icons.edit_note_rounded),
                    title: MediaQuery.of(context).size.width < x
                        ? Text("")
                        : Text('Student Management',
                        style: TextStyle(fontSize: fontsize)),
                    onTap: () {
                      Get.toNamed(StudentManagemet.routeName, arguments: [13]);
                    },


              ),
              // ListTile(
              //   tileColor: selectedIndex ==5 ? Colors.blueAccent.withOpacity(0.4) :Colors.transparent,
              //   hoverColor: Colors.white,
              //   leading: Icon(Icons.group),
              //   title:MediaQuery.of(context).size.width < x ? Text(""):  Text('User Management',style: TextStyle(fontSize: fontsize)),
              //   onTap: () {
              //       selectedIndex=5;
              //   },
              // ),
            ],
          ),
        ),
        const VerticalDivider(thickness: 2, width: 5),
        Expanded(child: widget.Content)

        // This is the main content.
        // Expanded(
        //       child: IndexedStack(
        //           index: _selectedIndex,
        //           children: _items
        //       )//_items.elementAt(_index),
        // ),
      ],
    );
  }
}
