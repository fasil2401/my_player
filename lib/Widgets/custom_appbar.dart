import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key,required this.titletext,}) : super(key: key);
  final String titletext;
  @override
  Size get preferredSize {
    return const Size.fromHeight(60.0);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      // leading:const Icon(Icons.arrow_back),
      title:  Text(
        titletext,
        style:const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 24
          ),
      ),
      centerTitle: true,
    );
  }
}
