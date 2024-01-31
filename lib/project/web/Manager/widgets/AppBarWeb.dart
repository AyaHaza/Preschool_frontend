import 'package:flutter/material.dart';


class appBarWeb extends StatelessWidget with PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.zero,
      child: SizedBox(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
