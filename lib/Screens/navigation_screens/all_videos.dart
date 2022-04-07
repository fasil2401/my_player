import 'package:flutter/material.dart';
import 'package:my_player/Widgets/custom_appbar.dart';
import 'package:my_player/Widgets/custom_list_tile_video.dart';

class AllVideoList extends StatelessWidget {
   AllVideoList({Key? key}) : super(key: key);
final List<String>file_names =[
    'Big B (2007)',
    'Loudspeaker (2009)',
    'Urumi (2011)',
    'Traffic (2011)',
    'Ustad Hotel (2012)',
    'Thattathin Marayathu',
    'Trivandrum Lodge',
    'Mumbai Police',
    'Mumbai Police',
    'Ustad Hotel (2012)',
    'Thattathin Marayathu',
  ];
  final List<String>file_url =[
    'https://s3.scoopwhoop.com/anj/mallumovies/e0363123-b2a8-4f21-8631-e07c1754deb1.jpg',
    'https://image.scoopwhoop.com/w620/s3.scoopwhoop.com/anj/mallumovies/0b25042f-edc7-4653-bc17-db7646f2aaa1.jpg',
    'https://image.scoopwhoop.com/w620/s3.scoopwhoop.com/anj/mallumovies/70101618-05b4-4b9c-8e9c-10ba1c2205d3.jpg',
    'https://image.scoopwhoop.com/w620/s4.scoopwhoop.com/anj/mallumovies/630e247d-41d1-4e97-b3b9-334e20723bf2.jpg',
    'https://image.scoopwhoop.com/w620/s3.scoopwhoop.com/anj/mallumovie/e0e0dab4-8b50-4ea0-b821-ccf51b4a488f.jpg',
    'https://image.scoopwhoop.com/w620/s3.scoopwhoop.com/anj/mallumovies/185a4e22-ac62-4e85-af99-b4127cb35753.jpg',
    'https://image.scoopwhoop.com/w620/s3.scoopwhoop.com/anj/mallumovies/a78726ae-4861-4ae4-8b74-f45deb005e35.jpg',
    'https://image.scoopwhoop.com/w620/s3.scoopwhoop.com/anj/mallumovies/24b4dee0-a59c-4d5c-8c0c-61e4944ee89d.jpg',
    'https://image.scoopwhoop.com/w620/s3.scoopwhoop.com/anj/mallumovies/24b4dee0-a59c-4d5c-8c0c-61e4944ee89d.jpg',
    'https://image.scoopwhoop.com/w620/s3.scoopwhoop.com/anj/mallumovies/185a4e22-ac62-4e85-af99-b4127cb35753.jpg',
    'https://image.scoopwhoop.com/w620/s3.scoopwhoop.com/anj/mallumovies/a78726ae-4861-4ae4-8b74-f45deb005e35.jpg',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titletext: 'All videos',
      ),
      // body: ListView.builder(
      //   itemCount: file_names.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return CustomListTileVideos(
      //        subtite: false, trailicon: true, index: index, text: file_names[index],url: file_url[index],);
      //   },
      // ),
    );
  }
}
