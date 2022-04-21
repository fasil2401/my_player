import 'package:flutter/material.dart';

class MenuItem {
  final String modeltext;
  final String selectedtext;
  final IconData icon;
  final IconData selectedIcon;

  const MenuItem( {required this.selectedIcon,required this.modeltext, required this.icon, required this.selectedtext});
}
