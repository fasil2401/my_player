import 'package:flutter/material.dart';
import 'package:my_player/Screens/navigation_screens/all_videos.dart';
import 'package:my_player/Screens/navigation_screens/favorite.dart';
import 'package:my_player/Screens/navigation_screens/folders.dart';
import 'package:my_player/Screens/navigation_screens/video_list.dart';
import 'package:my_player/Screens/onboarding/onboarding.dart';
import 'package:my_player/Screens/navigation_screens/settings.dart';
import 'package:my_player/Screens/player_screen/palyer.dart';
import 'package:my_player/Screens/splash/splash.dart';
import 'package:flutter/services.dart';
import 'package:my_player/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import 'Screens/navigation_screens/navigation.dart';

const first_time = 'UserLogedIn';

void main() {
 SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Color(0xFF100374), // status bar color
    statusBarBrightness: Brightness.dark,//status bar brigtness
    statusBarIconBrightness:Brightness.light , //status barIcon Brightness
    // systemNavigationBarDividerColor: Colors.greenAccent,//Navigation bar divider color
    // systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon 
  ));
  runApp(const MyApp());
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
      title: 'Flutter Demo',
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home:const SplashScreen(),
    );
      
    },);
    
  }
}


