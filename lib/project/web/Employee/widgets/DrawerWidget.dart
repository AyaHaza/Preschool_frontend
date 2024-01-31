import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/project/web/Employee/view/Exam/ViewPage.dart';

import '../view/Attendance/FetchForm.dart';
import '../view/BusMangement/BusAdd/BusAdd.dart';
import '../view/BusMangement/BusAll/BusAll.dart';
import '../view/Classes/ClassPage.dart';
import '../view/Classes/classAdd.dart';

import '../view/FileManagement/ViewPage.dart';
import '../view/Home/HomePage.dart';
import '../view/Levels/LevelAdd.dart';
import '../view/Levels/LevelPage.dart';
import '../view/RegistryMangement/RegisteryAll/RegisteryAll.dart';
import '../view/RegistryMangement/RegistryAdd/RegistruAdd.dart';
import '../view/Settings/Settings.dart';
import '../view/StudentMangement/StudentAdd/StudentAdd.dart';
import '../view/StudentMangement/StudentAll/StudentAll.dart';
import '../view/StudentsFees/ADD/FeesADD.dart';
import '../view/StudentsFees/Show/ShowFee.dart';
import '../view/StudentsFees/studentFee/fetch.dart';
import '../view/Subject/SubjectAdd.dart';
import '../view/Subject/SubjectPage.dart';
import '../view/TeacherMangement/AllTeacher.dart';

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
                leading: Icon(Icons.leaderboard_outlined),
                title: MediaQuery.of(context).size.width < x
                    ? Text("")
                    : Text('Level Management',
                        style: TextStyle(fontSize: fontsize)),
                children: [
                  ListTile(
                    tileColor: selectedIndex == 1
                        ? Colors.blueAccent.withOpacity(0.4)
                        : Colors.transparent,
                    hoverColor: Colors.white,
                    leading: Icon(Icons.add_box_outlined),
                    title: MediaQuery.of(context).size.width < x
                        ? Text("")
                        : Text('Level ADD',
                            style: TextStyle(fontSize: fontsize)),
                    onTap: () {
                      Get.toNamed(LevelAdd.routeName, arguments: [1]);
                    },
                  ),
                  ListTile(
                    tileColor: selectedIndex == 2
                        ? Colors.blueAccent.withOpacity(0.4)
                        : Colors.transparent,
                    hoverColor: Colors.white,
                    leading: Icon(Icons.edit_note_rounded),
                    title: MediaQuery.of(context).size.width < x
                        ? Text("")
                        : Text('Level Management',
                            style: TextStyle(fontSize: fontsize)),
                    onTap: () {
                      Get.toNamed(LevelManagemet.routeName, arguments: [2]);
                    },
                  ),
                ],
              ),
              ExpansionTile(
                leading: Icon(Icons.file_present),
                title: MediaQuery.of(context).size.width < x
                    ? Text("")
                    : Text('Class Management',
                        style: TextStyle(fontSize: fontsize)),
                children: [
                  ListTile(
                    tileColor: selectedIndex == 3
                        ? Colors.blueAccent.withOpacity(0.4)
                        : Colors.transparent,
                    hoverColor: Colors.white,
                    leading: Icon(Icons.add_box_outlined),
                    title: MediaQuery.of(context).size.width < x
                        ? Text("")
                        : Text('Class ADD',
                            style: TextStyle(fontSize: fontsize)),
                    onTap: () {
                      Get.toNamed(ClassAdd.routeName, arguments: [3]);
                    },
                  ),
                  ListTile(
                    tileColor: selectedIndex == 4
                        ? Colors.blueAccent.withOpacity(0.4)
                        : Colors.transparent,
                    hoverColor: Colors.white,
                    leading: Icon(Icons.edit_note_rounded),
                    title: MediaQuery.of(context).size.width < x
                        ? Text("")
                        : Text('Classes Management',
                            style: TextStyle(fontSize: fontsize)),
                    onTap: () {
                      Get.toNamed(ClassManagemet.routeName, arguments: [4]);
                    },
                  ),
                ],
              ),

              ExpansionTile(
                leading: Icon(Icons.subject_rounded),
                title: MediaQuery.of(context).size.width < x
                    ? Text("")
                    : Text('Subject  Management',
                        style: TextStyle(fontSize: fontsize)),
                children: [
                  ListTile(
                    tileColor: selectedIndex == 5
                        ? Colors.blueAccent.withOpacity(0.4)
                        : Colors.transparent,
                    hoverColor: Colors.white,
                    leading: Icon(Icons.add_box_outlined),
                    title: MediaQuery.of(context).size.width < x
                        ? Text("")
                        : Text('Subject ADD',
                            style: TextStyle(fontSize: fontsize)),
                    onTap: () {
                      Get.toNamed(SubjectAdd.routeName, arguments: [5]);
                    },
                  ),
                  ListTile(
                    tileColor: selectedIndex == 6
                        ? Colors.blueAccent.withOpacity(0.4)
                        : Colors.transparent,
                    hoverColor: Colors.white,
                    leading: Icon(Icons.edit_note_rounded),
                    title: MediaQuery.of(context).size.width < x
                        ? Text("")
                        : Text('Subject Management',
                            style: TextStyle(fontSize: fontsize)),
                    onTap: () {
                      Get.toNamed(SubjectManagemet.routeName, arguments: [6]);
                    },
                  ),
                ],
              ),

              ExpansionTile(
                leading: Icon(Icons.settings),
                title: MediaQuery.of(context).size.width < x
                    ? Text("")
                    : Text('Settings', style: TextStyle(fontSize: fontsize)),
                children: [
                  ListTile(
                    tileColor: selectedIndex == 9
                        ? Colors.blueAccent.withOpacity(0.4)
                        : Colors.transparent,
                    hoverColor: Colors.white,
                    leading: Icon(Icons.edit),
                    title: MediaQuery.of(context).size.width < x
                        ? Text("")
                        : Text('Settings Edit',
                            style: TextStyle(fontSize: fontsize)),
                    onTap: () {
                      Get.toNamed(Settings.routeName, arguments: [9]);
                    },
                  ),
                ],
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

              ExpansionTile(
                leading: Icon(Icons.book),
                title: MediaQuery.of(context).size.width < x
                    ? Text("")
                    : Text('Student Management',
                        style: TextStyle(fontSize: fontsize)),
                children: [
                  ListTile(
                    tileColor: selectedIndex == 12
                        ? Colors.blueAccent.withOpacity(0.4)
                        : Colors.transparent,
                    hoverColor: Colors.white,
                    leading: Icon(Icons.add_box_outlined),
                    title: MediaQuery.of(context).size.width < x
                        ? Text("")
                        : Text('Student ADD',
                            style: TextStyle(fontSize: fontsize)),
                    onTap: () {
                      Get.toNamed(StudentAdd.routeName, arguments: [12]);
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
                ],
              ),
              ExpansionTile(
                leading: Icon(Icons.bus_alert),
                title: MediaQuery.of(context).size.width < x
                    ? Text("")
                    : Text('Bus Management',
                        style: TextStyle(fontSize: fontsize)),
                children: [
                  ListTile(
                    tileColor: selectedIndex == 14
                        ? Colors.blueAccent.withOpacity(0.4)
                        : Colors.transparent,
                    hoverColor: Colors.white,
                    leading: Icon(Icons.add_box_outlined),
                    title: MediaQuery.of(context).size.width < x
                        ? Text("")
                        : Text('Bus ADD', style: TextStyle(fontSize: fontsize)),
                    onTap: () {
                      Get.toNamed(BusAdd.routeName, arguments: [14]);
                    },
                  ),
                  ListTile(
                    tileColor: selectedIndex == 17
                        ? Colors.blueAccent.withOpacity(0.4)
                        : Colors.transparent,
                    hoverColor: Colors.white,
                    leading: Icon(Icons.edit_note_rounded),
                    title: MediaQuery.of(context).size.width < x
                        ? Text("")
                        : Text('Bus Management',
                            style: TextStyle(fontSize: fontsize)),
                    onTap: () {
                      Get.toNamed(BusManagemet.routeName, arguments: [17]);
                    },
                  ),
                ],
              ),
              ExpansionTile(
                  leading: Icon(Icons.check_box_outlined),
                  title: MediaQuery.of(context).size.width < x
                      ? Text("")
                      : Text('Attendance Management',
                          style: TextStyle(fontSize: fontsize)),
                  children: [
                    ListTile(
                      tileColor: selectedIndex == 18
                          ? Colors.blueAccent.withOpacity(0.4)
                          : Colors.transparent,
                      hoverColor: Colors.white,
                      leading: Icon(Icons.check_box_outlined),
                      title: MediaQuery.of(context).size.width < x
                          ? Text("")
                          : Text('Attendance Management',
                              style: TextStyle(fontSize: fontsize)),
                      onTap: () {
                        Get.toNamed(AttendanceView.routeName, arguments: [18]);
                      },
                    ),

                  ]),



 ExpansionTile(
                  leading: Icon(Icons.attach_money_rounded),
                  title: MediaQuery.of(context).size.width < x
                      ? Text("")
                      : Text('Students Fee Management',
                      style: TextStyle(fontSize: fontsize)),
                  children: [
                    ListTile(
                      tileColor: selectedIndex == 19
                          ? Colors.blueAccent.withOpacity(0.4)
                          : Colors.transparent,
                      hoverColor: Colors.white,
                      leading: Icon(Icons.add_box_outlined),
                      title: MediaQuery.of(context).size.width < x
                          ? Text("")
                          : Text('Student Fee ADD',
                          style: TextStyle(fontSize: fontsize)),
                      onTap: () {
                        Get.toNamed(FeeAdd.routeName, arguments: [19]);
                      },
                    ),
                    ListTile(
                      tileColor: selectedIndex == 20
                          ? Colors.blueAccent.withOpacity(0.4)
                          : Colors.transparent,
                      hoverColor: Colors.white,
                      leading: Icon(Icons.search),
                      title: MediaQuery.of(context).size.width < x
                          ? Text("")
                          : Text('Student Fee View',
                          style: TextStyle(fontSize: fontsize)),
                      onTap: () {
                        Get.toNamed(Feefetch.routeName, arguments: [20]);
                      },
                    ),
                    ListTile(
                      tileColor: selectedIndex == 21
                          ? Colors.blueAccent.withOpacity(0.4)
                          : Colors.transparent,
                      hoverColor: Colors.white,
                      leading: Icon(Icons.book),
                      title: MediaQuery.of(context).size.width < x
                          ? Text("")
                          : Text('All Students Fee View',
                          style: TextStyle(fontSize: fontsize)),
                      onTap: () {
                        Get.toNamed(FeeConfigShow.routeName, arguments: [21]);
                      },
                    ),
                  ]),


              ExpansionTile(
                  leading: Icon(Icons.file_present_rounded),
                  title: MediaQuery.of(context).size.width < x
                      ? Text("")
                      : Text('File Management',
                      style: TextStyle(fontSize: fontsize)),
                  children: [
                    ListTile(
                      tileColor: selectedIndex == 22
                          ? Colors.blueAccent.withOpacity(0.4)
                          : Colors.transparent,
                      hoverColor: Colors.white,
                      leading: Icon(Icons.picture_as_pdf),
                      title: MediaQuery.of(context).size.width < x
                          ? Text("")
                          : Text('Files Management',
                          style: TextStyle(fontSize: fontsize)),
                      onTap: () {
                        Get.toNamed(FileManagemet.routeName, arguments: [22]);
                      },
                    ),
                  ]),
              ExpansionTile(
                  leading: Icon(Icons.file_copy_rounded),
                  title: MediaQuery.of(context).size.width < x
                      ? Text("")
                      : Text('Exam Management',
                      style: TextStyle(fontSize: fontsize)),
                  children: [
                    ListTile(
                      tileColor: selectedIndex == 23
                          ? Colors.blueAccent.withOpacity(0.4)
                          : Colors.transparent,
                      hoverColor: Colors.white,
                      leading: Icon(Icons.file_present_sharp),
                      title: MediaQuery.of(context).size.width < x
                          ? Text("")
                          : Text('Exams View',
                          style: TextStyle(fontSize: fontsize)),
                      onTap: () {
                        Get.toNamed(ExamsView.routeName, arguments: [23]);
                      },
                    ),
                  ]),


              // ListTile(
              //   tileColor: selectedIndex ==5 ? Colors.blueAccent.withOpacity(0.4) :Colors.transparent,
              //   hoverColor: Colors.white,
              //   leading: Icon(Icons.group),
              //   title:MediaQuery.of(context).size.width < x ? Text(""):  Text('User Management',style: TextStyle(fontSize: fontsize)),
              //   onTap: () {
              //       selectedIndex=5;
              //   },
              // ),
              ListTile(
                  tileColor: selectedIndex ==19 ? Colors.blueAccent.withOpacity(0.4) :Colors.transparent,
                  hoverColor: Colors.white,
                  leading: Icon(Icons.group),
                  title:MediaQuery.of(context).size.width < x ? Text(""):  Text('Teacher Management',style: TextStyle(fontSize: fontsize)),
                  onTap: () {
                    Get.toNamed( TeacherManagemet.routeName,arguments: [19]);
                  })
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
