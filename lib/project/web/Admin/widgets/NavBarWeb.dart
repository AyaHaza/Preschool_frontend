// import 'dart:core';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../Data/DrawerData.dart';
// import '../view/Levels/LevelAdd.dart';
// import '../view/Home/HomePage.dart';
// import '../view/UserManagement/UserManagementPage.dart';
//
//
// class NavBarWeb extends StatefulWidget {
//   @override
//   State<NavBarWeb> createState() => _NavBarWebState();
// }
//
// class _NavBarWebState extends State<NavBarWeb> {
//   int _selectedIndex = 0;
//   NavigationRailLabelType labelType = NavigationRailLabelType.all;
//   bool showLeading = false;
//   bool showTrailing = false;
//   double groupAligment = -1.0;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//             children: <Widget>[
//               SizedBox(
//                 width: 150.w,
//                 child: NavigationRail(
//                   backgroundColor: Colors.white10,
//                   selectedIndex: _selectedIndex,
//                   groupAlignment: groupAligment,
//                   onDestinationSelected: (int index) {
//                     setState(() {
//                       _selectedIndex = index;
//                     });
//                   },
//                   labelType: labelType,
//                  destinations:nav(),
//
//                 ),
//               ),
//               const VerticalDivider(thickness: 1, width: 1),
//               // This is the main content.
//               Expanded(
//                 child:
//              Center(
//           child: IndexedStack(
//             index: _selectedIndex,
//             children: _items
//           )//_items.elementAt(_index),
//         ),  ),
//             ],
//
//     );
//   }
//
//    List<NavigationRailDestination> nav(){
//      List<NavigationRailDestination> list =[];
//      DrawerData.menue.asMap().forEach((index, element) {
//        list.add(NavigationRailDestination(
//          icon: Icon(element.icon),
//          selectedIcon: Icon(element.icon,color: Theme.of(context).primaryColor),
//          label: Text(''),
//        ));
//      });
//      return list;
//   }
//
// }
