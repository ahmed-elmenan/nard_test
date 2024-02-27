import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    Widget? leading,
    List<Widget>? actions,
  }) : super(
          leadingWidth: 100,
          leading: leading,
          actions: actions,
          elevation: 0,
          titleSpacing: 0,
        );
}
