import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/Home/HomePage.dart';
import '../view/RegistryMangement/RegisteryAll/RegisteryAll.dart';
import '../view/RegistryMangement/RegistryAdd/RegistruAdd.dart';
import '../view/School/SchoolEdit.dart';
import '../view/UserManagement/UserManagementPage.dart';

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
              ExpansionTile(
                leading: Icon(Icons.info),
                title: MediaQuery.of(context).size.width < x
                    ? Text("")
                    : Text('School Management',
                        style: TextStyle(fontSize: fontsize)),
                children: [
                  ListTile(
                    tileColor: selectedIndex == 1
                        ? Colors.blueAccent.withOpacity(0.4)
                        : Colors.transparent,
                    hoverColor: Colors.white,
                    leading: Icon(Icons.edit),
                    title: MediaQuery.of(context).size.width < x
                        ? Text("")
                        : Text('School Info Edit',
                            style: TextStyle(fontSize: fontsize)),
                    onTap: () {
                      Get.toNamed(SchoolEdit.routeName, arguments: [1]);
                    },
                  ),
                ],
              ),
             ListTile(
                tileColor: selectedIndex == 2
                    ? Colors.blueAccent.withOpacity(0.4)
                    : Colors.transparent,
                hoverColor: Colors.white,
                leading: Icon(Icons.edit_note_rounded),
                title: MediaQuery.of(context).size.width < x
                    ? Text("")
                    : Text('Users Management',
                        style: TextStyle(fontSize: fontsize)),
                onTap: () {
                  Get.toNamed(UserManagement.routeName, arguments: [2]);
                },
              ),
              ExpansionTile(
                leading: Icon(Icons.group),
                title: MediaQuery.of(context).size.width < x
                    ? Text("")
                    : Text('Registry Management',
                    style: TextStyle(fontSize: fontsize)),
                children: [
                  ListTile(
                    tileColor: selectedIndex == 10
                        ? Colors.blueAccent.withOpacity(0.4)
                        : Colors.transparent,
                    hoverColor: Colors.white,
                    leading: Icon(Icons.add_box_outlined),
                    title: MediaQuery.of(context).size.width < x
                        ? Text("")
                        : Text('Registry ADD',
                        style: TextStyle(fontSize: fontsize)),
                    onTap: () {
                      Get.toNamed(RegisteryAdd.routeName, arguments: [10]);
                    },
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
                ],
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
