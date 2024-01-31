import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final Widget smallMobile;

  const Responsive(
      {required this.mobile,
      required this.tablet,
      required this.desktop,
      required this.smallMobile});

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 700;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 800 &&
      MediaQuery.of(context).size.width >= 500;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    // If our width is more than 1200 then we consider it a desktop
    if (_size.width >= 800) {
      return desktop;
    }
    // If width it less then 1200 and more then 768 we consider it as tablet
    else if (_size.width >= 500 && tablet != null) {
      return tablet;
    }
    // Or less then that we called it mobile
    else if (_size.width >= 376 && _size.width <= 500 && mobile != null) {
      return mobile;
    } else {
      return mobile;
    }
  }
}
