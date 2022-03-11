import 'package:flutter/material.dart';

class ColorDetailsPage extends StatelessWidget {
  const ColorDetailsPage({ Key? key, required this.color, required this.title, this.materialIndex: 0 }) : super(key: key);

  final MaterialColor color;
  final String title;
  final int materialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: color,
        title: Text(
          '$title[$materialIndex]',
        ),
      ),
       body: Container(
        color: color[materialIndex],
      ),
    );
  }
}