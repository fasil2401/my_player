import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_player/Screens/navigation_screens/all_videos.dart';
import 'package:my_player/Screens/navigation_screens/favorite.dart';
import 'package:my_player/Screens/navigation_screens/folders.dart';
import 'package:my_player/Screens/navigation_screens/video_list.dart';
import 'package:my_player/Screens/onboarding/onboarding.dart';
import 'package:my_player/Screens/navigation_screens/settings.dart';
import 'package:my_player/Screens/player_screen/palyer.dart';
import 'package:my_player/Screens/splash/splash.dart';
import 'package:flutter/services.dart';
import 'package:my_player/model/model.dart';
import 'package:my_player/provider/theme_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'Screens/navigation_screens/navigation.dart';

const first_time = 'UserLogedIn';
List<String> pathListMain = [];

const videoBox = 'boxVideos';
const favoriteBox = 'boxFavorites';
const playlistBox = 'boxPlaylist';
const playlistVideoBox = 'boxPlaylistVideo';
bool restarting = true;

void main() async {
  restarting = true;
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Color(0xFF100374), // status bar color
    statusBarBrightness: Brightness.dark, //status bar brigtness
    statusBarIconBrightness: Brightness.light, //status barIcon Brightness
    // systemNavigationBarDividerColor: Colors.greenAccent,//Navigation bar divider color
    // systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(VideosAdapter());
  Hive.registerAdapter(FavoritesAdapter());
  Hive.registerAdapter(PlayListAdapter());
  Hive.registerAdapter(PlayListVideosAdapter());

  await Hive.openBox<Videos>(videoBox);
  await Hive.openBox<Favorites>(favoriteBox);
  await Hive.openBox<PlayList>(playlistBox);
  await Hive.openBox<PlayListVideos>(playlistVideoBox);
  requestPermission();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
  await Hive.openBox('pathlist');

  runApp(const MyApp());
}

void requestPermission() async {
  var requestStatus = await Permission.storage.status;
  if (requestStatus.isDenied) {
    Permission.storage.request();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          themeMode: themeProvider.themeMode,
          debugShowCheckedModeBanner: false,
          title: 'My Player',
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.lightTheme,
          home: const SplashScreen(),
        );
      },
    );
  }
}
