import 'package:flutter/material.dart';
import 'package:my_player/Screens/navigation_screens/widgets/tab_item.dart';



class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {Key? key, required this.currentTab, required this.onSelectTab})
      : super(key: key);
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.folder),
        _buildItem(tabItem: TabItem.allVideos),
        _buildItem(tabItem: TabItem.favorite),
        _buildItem(tabItem: TabItem.settings),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
      // selectedItemColor: activeTabColor[currentTab]!,
    );
  }
  
  BottomNavigationBarItem _buildItem({TabItem? tabItem}) {
    
    
    return BottomNavigationBarItem(
      icon: Icon(
        tabIcon[tabItem],
        // color: Colors.grey,
      ),
      label:  '',
    );
  }
}
