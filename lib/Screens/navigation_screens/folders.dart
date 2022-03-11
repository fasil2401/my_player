import 'package:flutter/material.dart';
import 'package:my_player/Widgets/custom_appbar.dart';
import 'package:my_player/Widgets/custom_list_tile_folder.dart';

class FolderScreen extends StatelessWidget {
   FolderScreen({Key? key}) : super(key: key);

 final List<String>folder_names =[
    'Android',
    'WhatsApp',
    'Status Saver',
    'Movies',
    'Songs',
    'Personal',
    'Works',
    'Tesing'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titletext: 'Folder',
      ),
      body: ListView.builder(
          itemCount: folder_names.length,
          itemBuilder: (BuildContext context, int index) {
            return CustomListTileFolder(subtite: true, trailicon: false, index: index, text: folder_names[index],);
          }),
    );
  }
}


