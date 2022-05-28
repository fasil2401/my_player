import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_player/Widgets/custom_appbar.dart';
import 'package:my_player/Widgets/custom_list_tile_video.dart';
import 'package:my_player/controllers/video_controller/video_controller.dart';
import 'package:my_player/main.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../model/model.dart';

class VideoList extends StatelessWidget {
  VideoList({Key? key, required this.folderName, required this.pathList})
      : super(key: key);
  final String folderName ;
  List<String> pathList = [];


  // List<String> viewList = [];
  // List thumbs = [];
  List<String> _pathList = [];
  List thumbs = [];
  bool? isFavorite;
  var key;
  // var boxVideos = Hive.box<Videos>(videoBox);

  // @override
  // void initState() {
  //   getVideos();
  //   // TODO: implement initState
  //   super.initState();
  // }

  // Future getVideos() async {
  //   for (var i = 0; i < widget.pathList.length; i++) {
  //     // print('${widget.pathList[i]}');
  //     List<String> video = widget.pathList[i].split('/').toList();
  //     print(video);
  //     if (video.contains(widget.folderName)) {
  //       String url = video.join('/');
  //       // String name = video[video.length-1];

  //       var key = (await VideoThumbnail.thumbnailData(
  //         video: url,
  //         imageFormat: ImageFormat.JPEG,
  //         maxWidth: 128,
  //         quality: 25,
  //       ));
  //       thumbs.add(key);
  //       setState(() {});
  //       viewList.add(url);
  //     }
  //   }
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         titletext: folderName,
//       ),
//       body: ValueListenableBuilder(
//         valueListenable: boxVideos.listenable(),
//         builder: (BuildContext context, Box<Videos> value, Widget? child) {
//           List<Videos> videoPaths = value.values.toList();
//           print('ivde aanooov all videos  ${videoPaths}');
//           for (var i = 0; i < videoPaths.length; i++) {
//             List<String> video = videoPaths[i].paths.split('/').toList();
//             if (video.contains(folderName)) {
//               //  keyList.add(videoPaths[i].key);
//               isFavorite = videoPaths[i].fav;
//               // key = videoPaths[i].key;
//               _pathList.add(videoPaths[i].paths);
//               thumbs.add(videoPaths[i].thumb);
//             }
//             // _pathList.add(videoPaths[i].paths);
//             // thumbs.add(videoPaths[i].thumb);
//           }
//           return ListView.builder(
//             itemCount: _pathList.length,
//             itemBuilder: (BuildContext context, int index) {
//               return CustomListTileVideos(
//                 subtite: false,
//                 trailicon: true,
//                 index: index,
//                 text: _pathList[index].split('/').last,
//                 url: thumbs[index],
//                 folderName: '',
//                 pathList: _pathList,
//                 Customkey: key,
//                 isFavorite: isFavorite!,
//               );
//             },
//           );
//         },
//       ),
//       // body: ListView.builder(
//       //   itemCount: viewList.length,
//       //   itemBuilder: (BuildContext context, int index) {
//       //     return CustomListTileVideos(
//       //       subtite: false,
//       //       trailicon: true,
//       //       index: index,
//       //       text: viewList[index].split('/').last,
//       //       url: thumbs[index],
//       //       folderName: widget.folderName,
//       //       pathList: viewList,
//       //     );
//       //   },
//       // ),
//     );
//   }
// }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titletext: folderName,
      ),
      body: GetBuilder<VideoController>(
        
        builder: (cont) {
          List<dynamic> videoPaths = cont.observableVideoBox.values.toList();
          print('ivde aanooov all videos  ${videoPaths}');
          print('ivde aanooov  ${folderName}');
          for (var i = 0; i < videoPaths.length; i++) {
            List<String> video = videoPaths[i].paths.split('/').toList();
            if (video.contains(folderName)) {
              //  keyList.add(videoPaths[i].key);
              isFavorite = videoPaths[i].fav;
              // key = videoPaths[i].key;
              _pathList.add(videoPaths[i].paths);
              thumbs.add(videoPaths[i].thumb);
            }
            // _pathList.add(videoPaths[i].paths);
            // thumbs.add(videoPaths[i].thumb);
          }
          return ListView.builder(
            itemCount: _pathList.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomListTileVideos(
                path: _pathList[index],
                subtite: false,
                trailicon: true,
                index: index,
                text: _pathList[index].split('/').last,
                url: thumbs[index],
                folderName: '',
                pathList: _pathList,
                Customkey: key,
                isFavorite: isFavorite!,
              );
            },
          );
        },
      ),
      // body: ListView.builder(
      //   itemCount: viewList.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return CustomListTileVideos(
      //       subtite: false,
      //       trailicon: true,
      //       index: index,
      //       text: viewList[index].split('/').last,
      //       url: thumbs[index],
      //       folderName: widget.folderName,
      //       pathList: viewList,
      //     );
      //   },
      // ),
    );
  }
}
