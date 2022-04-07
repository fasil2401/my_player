import 'package:flutter/material.dart';
import 'package:my_player/Widgets/custom_appbar.dart';
import 'package:my_player/Widgets/custom_list_tile_folder.dart';
import 'package:my_player/provider/search_files.dart';

class FolderScreen extends StatefulWidget {
   FolderScreen({Key? key}) : super(key: key);

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {

  List<String> _pathList = [];
  List<String> folderName = [];
  List<String> folderNameFinal = [];
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
  void initState() {
    getFiles();
    // TODO: implement initState
    super.initState();
  }
Future getFiles() async {
    final value = '.mp4,.mkv,.webm'
        // final value = '.mp4'
        .trim()
        .replaceAll(' ', '')
        .split(',');
    if (value.isEmpty) {
      return;
    }
    SearchFilesInStorage.searchInStorage(
      value,
      (List<String> data) {
        _pathList.clear();
        // print(data);
        setState(() {
          _pathList.addAll(data);
          for (var i = 0; i < _pathList.length; i++) {
         List<String> folder = _pathList[i].split('/').toList();
         String name = folder[folder.length-2];
         folderName.add(name);
        }
        folderNameFinal = folderName.toSet().toList();
        folderNameFinal.remove('0');
        });
        
      },
      (error) {},
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titletext: 'Folder',
      ),
      body: ListView.builder(
          itemCount:  folderNameFinal.length,
          itemBuilder: (context, index) {
            return CustomListTileFolder( subtite: false,
            trailicon: true,
            index: index,
            // text: _pathList[index].split('/').last,
             text: folderNameFinal[index],
             folderName: folderNameFinal[index], pathList: _pathList,);
          }),
    );
  }
}


