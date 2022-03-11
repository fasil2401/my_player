import 'package:flutter/material.dart';

late Color iconColor;

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  
  static final darkTheme = ThemeData(
    
    scaffoldBackgroundColor:const Color.fromARGB(238, 64, 64, 65),
    colorScheme: const ColorScheme.dark().copyWith(secondary: Colors.transparent),
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
    listTileTheme:const ListTileThemeData(
      iconColor: Colors.purple,
    ),
    backgroundColor: const Color.fromARGB(255, 30, 30, 31),
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedIconTheme:  IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
      selectedIconTheme: IconThemeData(color: Colors.purple),
    )
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(242, 237, 241, 250),
    colorScheme: const ColorScheme.light().copyWith(secondary: Colors.transparent),
    iconTheme:const IconThemeData(color: Color(0xFF837DAB)),
    listTileTheme:const ListTileThemeData(
      iconColor:  Color(0xFF837DAB),
    ),
    textTheme:const TextTheme(),
    appBarTheme:const AppBarTheme(
      backgroundColor:  Color(0xFF100374) ,
      
    ),
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      unselectedIconTheme:  IconThemeData(color: Color(0xFF837DAB)),
      selectedIconTheme: IconThemeData(color: Color(0xFF100374)),
    )
  );
}
