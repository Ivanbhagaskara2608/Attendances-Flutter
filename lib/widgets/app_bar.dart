import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset("assets/logo_attendances.png", width: 62, height: 62),
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: const Color.fromARGB(255, 44, 62, 80)),
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
