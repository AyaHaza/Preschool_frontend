import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Controller/Authentication/AuthController.dart';
import '../view/Authentication/login.dart';
import '../view/Home/HomePage.dart';
import '../view/Profile/ProfileEdit.dart';


/// An enhanced enum to define the available menus and their shortcuts.
///
/// Using an enum for menu definition is not required, but this illustrates how
/// they could be used for simple menu systems.
enum MenuEntry {
  Profile('Profile          '),
  Logout('Logout            ');
  const MenuEntry(this.label);
  final String label;
}

 class MyCascadingMenu extends StatefulWidget {

  @override
  State<MyCascadingMenu> createState() => _MyCascadingMenuState();
}

class _MyCascadingMenuState extends State<MyCascadingMenu> {
  MenuEntry? _lastSelection;
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MenuAnchor(
            childFocusNode: _buttonFocusNode,
            menuChildren: <Widget>[
              MenuItemButton(
                child: Text(MenuEntry.Profile.label),
                onPressed: () => _activate(MenuEntry.Profile),
              ),
              MenuItemButton(
                child: Text(MenuEntry.Logout.label),
                onPressed: () => _activate(MenuEntry.Logout),
              ),
              // SubmenuButton(
              //   menuChildren: <Widget>[
              //     MenuItemButton(
              //       onPressed: () => _activate(MenuEntry.colorRed),
              //       shortcut: MenuEntry.colorRed.shortcut,
              //       child: Text(MenuEntry.colorRed.label),
              //     ),
              //     MenuItemButton(
              //       onPressed: () => _activate(MenuEntry.colorGreen),
              //       shortcut: MenuEntry.colorGreen.shortcut,
              //       child: Text(MenuEntry.colorGreen.label),
              //     ),
              //     MenuItemButton(
              //       onPressed: () => _activate(MenuEntry.colorBlue),
              //       shortcut: MenuEntry.colorBlue.shortcut,
              //       child: Text(MenuEntry.colorBlue.label),
              //     ),
              //   ],
              //   child: const Text('Background Color'),
              // ),
            ],
            builder:
                (BuildContext context, MenuController controller, Widget? child) {
              return TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                        )
                    )
                ),
                focusNode: _buttonFocusNode,
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                child:  GetBuilder<AuthController>(
                  builder: (controller) =>CircleAvatar(
                    radius: 17,
                  backgroundImage: controller.user!.photo !=null? Image.network(controller.user!.photo!).image :ExactAssetImage("images/profile.jpg") as ImageProvider,
                  ),
                )
              );
            },
          ),
        ],
      ),
    );
  }

  void _activate(MenuEntry selection) {
    setState(() {
      _lastSelection = selection;
    });

    switch (selection) {
      case MenuEntry.Profile:
      Get.toNamed(ProfileEditPage.routeName);
      break;
      case MenuEntry.Logout:
        Get.toNamed(Login.routeName);
        break;
    }
  }
}

