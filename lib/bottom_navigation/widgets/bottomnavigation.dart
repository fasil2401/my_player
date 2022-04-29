import 'package:flutter/material.dart';
import 'package:my_player/bottom_navigation/screenhome.dart';
import 'package:my_player/icons/my_flutter_app_icons.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.08,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25), topLeft: Radius.circular(25)),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 0.1),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        child: ValueListenableBuilder(
          valueListenable: ScreenHome.selectedIndexNotifier,
          builder: (BuildContext ctx, int updatedIndex, _) {
            return BottomNavigationBar(
              // backgroundColor: Colors.white,
              elevation: 0,
              currentIndex: updatedIndex,
              onTap: (newIndex) {
                ScreenHome.selectedIndexNotifier.value = newIndex;
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              selectedLabelStyle: TextStyle(
                fontSize: 10,
              ),
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: false,
              iconSize: 20,
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(
                    MyFlutterApp.folder_1,
                  ),
                  label: '⦿',
                  activeIcon: Icon(MyFlutterApp.folder_1, size: 25),
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    MyFlutterApp.video_library,
                  ),
                  activeIcon: Icon(MyFlutterApp.video_library, size: 25),
                  label: '⦿',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(MyFlutterApp.heart),
                  label: '⦿',
                  activeIcon: Icon(MyFlutterApp.heart, size: 25),
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    MyFlutterApp.cog_outline,
                  ),
                  label: '⦿',
                  activeIcon: Icon(
                    MyFlutterApp.cog_outline,
                    size: 25,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
