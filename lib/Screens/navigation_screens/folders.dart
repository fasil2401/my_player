import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_player/Widgets/custom_appbar.dart';
import 'package:my_player/Widgets/custom_list_tile_folder.dart';
import 'package:my_player/main.dart';
import 'package:my_player/model/model.dart';
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
  var boxVideos = Hive.box<Videos>(videoBox);

//  @override
//   void initState() {
//     synchronise();
//     // TODO: implement initState
//     super.initState();
//   }

//   void synchronise() async {
//     await getFiles();
//     // print('got pathhhhhhhhhhh$_pathList');
//     boxVideos.put(0,Videos(paths: _pathList));
//   }

//   Future getFiles() async {
//     final value = '.mp4,.mkv,.webm'
//         // final value = '.mp4'
//         .trim()
//         .replaceAll(' ', '')
//         .split(',');
//     if (value.isEmpty) {
//       return;
//     }
//     SearchFilesInStorage.searchInStorage(
//       value,
//       (List<String> data) {
//         _pathList.clear();
//         // print(data);
//         setState(() {
//           _pathList.addAll(data);
//           for (var i = 0; i < _pathList.length; i++) {
//             List<String> folder = _pathList[i].split('/').toList();
//             String name = folder[folder.length - 2];
//             //  folderName.add(name);
//           }
//           // folderNameFinal = folderName.toSet().toList();
//           // folderNameFinal.remove('0');
//           // pathListMain= _pathList;
//         });
//       },
//       (error) {},
//     );
//   }
//   @override
//   void initState() {
//     // getFiles();
//     // TODO: implement initState
//     super.initState();
//   }
// Future getFiles() async {
//     final value = '.mp4,.mkv,.webm'
//         // final value = '.mp4'
//         .trim()
//         .replaceAll(' ', '')
//         .split(',');
//     if (value.isEmpty) {
//       return;
//     }
//     SearchFilesInStorage.searchInStorage(
//       value,
//       (List<String> data) {
//         _pathList.clear();
//         // print(data);
//         setState(() {
//           _pathList.addAll(data);
//           for (var i = 0; i < _pathList.length; i++) {
//          List<String> folder = _pathList[i].split('/').toList();
//          String name = folder[folder.length-2];
//          folderName.add(name);
//         }
//         folderNameFinal = folderName.toSet().toList();
//         folderNameFinal.remove('0');
//         pathListMain= _pathList;
//         });

//       },
//       (error) {},
//     );
//   }
@override
  void dispose() {
    
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titletext: 'Folder',
      ),
      body: ValueListenableBuilder(
        valueListenable: boxVideos.listenable(),
        builder: (BuildContext context, Box<Videos> value, Widget? child) {
          List<Videos> videoPaths = value.values.toList();
          print('ivde aanooov  ${videoPaths}');
          for (var i = 0; i < videoPaths.length; i++) {
            // List<String> pathall = videoPaths[i].paths;

            _pathList.add(videoPaths[i].paths);
            List<String> folder = videoPaths[i].paths.split('/').toList();
            String name = folder[folder.length - 2];
            folderName.add(name);
          }
          folderNameFinal = folderName.toSet().toList();
          folderNameFinal.remove('0');

          return ListView.builder(
            itemCount: folderNameFinal.length,
            itemBuilder: (context, index) {
              return CustomListTileFolder(
                subtite: false,
                trailicon: false,
                index: index,
                text: folderNameFinal[index],
                folderName: folderNameFinal[index],
                pathList: _pathList,
              );
            },
          );
        },
      ),
    );
  }
}
