import 'package:flutter/material.dart';
import 'package:my_player/Widgets/custom_appbar.dart';
import 'package:my_player/Widgets/custom_list_tile_video.dart';

class VideoList extends StatefulWidget {
   VideoList({Key? key,required this.folderName,required this.pathList}) : super(key: key);
final String folderName;
List<String>pathList = [];

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  List<String>viewList = [];

  @override
  void initState() {
    getVideos();
    // TODO: implement initState
    super.initState();
  }
  Future getVideos() async{
    for (var i = 0; i < widget.pathList.length; i++) {
      List<String> video = widget.pathList[i].split('/').toList();
      if (video.contains(widget.folderName)) {
       String url = video.join('/');
        // String name = video[video.length-1];
        viewList.add(url);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        titletext: widget.folderName,
      ),
      body: ListView.builder(
        itemCount:  viewList.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomListTileVideos(
               subtite: false, trailicon: true, index: index, text: viewList[index].split('/').last, url: '', folderName: widget.folderName, pathList : viewList,);
        },
      ),
    );
  }
}
