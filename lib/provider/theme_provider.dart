import 'dart:ui';

import 'package:flutter/material.dart';

late Color iconColor;

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  
  static final darkTheme = ThemeData(
    
    scaffoldBackgroundColor: Color.fromARGB(241, 48, 48, 48),
    colorScheme: const ColorScheme.light().copyWith(secondary: Colors.transparent),
    iconTheme:const IconThemeData(color: Color.fromARGB(255, 124, 124, 124)),
    
    listTileTheme: ListTileThemeData(
      textColor: Colors.white.withOpacity(0.8),
      iconColor: Color.fromARGB(255, 124, 124, 124)
    ),
     textTheme: TextTheme(
      //  bodyText1: TextStyle(
      //    color: Colors.white
      //  ),
        bodyText2: TextStyle(
         color: Colors.white.withOpacity(0.8)
       )
     ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.black
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      counterStyle: TextStyle(
        color: Colors.white.withOpacity(0.8),
      ),
      helperStyle: TextStyle(
         color: Colors.white.withOpacity(0.8),
      ),
      hintStyle: TextStyle(
        color: Colors.white.withOpacity(0.8),
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        textStyle: TextStyle(
          color: Colors.white.withOpacity(0.8),
        )
      )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.black
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white.withOpacity(0.8)
      ),
      backgroundColor: const Color.fromARGB(255, 22, 22, 22) ,
  
    ),
    // dialogBackgroundColor: Color.fromARGB(241, 48, 48, 48),
    dialogTheme: DialogTheme(
    
      contentTextStyle: TextStyle(
        color: Colors.white.withOpacity(0.8)
      ),
      backgroundColor: Color.fromARGB(241, 48, 48, 48),
      titleTextStyle: TextStyle(
        color: Colors.white.withOpacity(0.8)
      )
    ),
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      unselectedIconTheme:  IconThemeData(color: Color.fromARGB(255, 177, 177, 177)),
      selectedIconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
      backgroundColor: Color.fromARGB(255, 0, 0, 0)
    )
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(242, 237, 241, 250),
    colorScheme: const ColorScheme.light().copyWith(secondary: Colors.transparent),
    iconTheme:const IconThemeData(color: Color(0xFF837DAB)),
    listTileTheme:const ListTileThemeData(
      
      iconColor:  Color(0xFF100374)
    ),
    textTheme:const TextTheme(),
    appBarTheme:const AppBarTheme(
      backgroundColor:  Color(0xFF100374) ,
  
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF100374),
        textStyle: TextStyle(
          color: Colors.white.withOpacity(0.8),
        )
      )
    ),
    
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF100374)
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedIconTheme:  IconThemeData(color: Color(0xFF837DAB)),
      selectedIconTheme: IconThemeData(color: Color(0xFF100374)),
      backgroundColor: Colors.white,
    )
  );
}
