import 'package:flutter/material.dart';
import 'package:my_player/Screens/navigation_screens/widgets/bottomnavigation.dart';
import 'package:my_player/Screens/navigation_screens/widgets/tab_item.dart';
import 'package:my_player/Screens/navigation_screens/widgets/tab_navigator.dart';
import 'package:my_player/main.dart';

class App extends StatefulWidget {
  const App({ Key? key }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

    var _currentTab = TabItem.folder;
  final _navigatorKeys = {
    TabItem.folder: GlobalKey<NavigatorState>(),
    TabItem.allVideos: GlobalKey<NavigatorState>(),
    TabItem.favorite: GlobalKey<NavigatorState>(),
    TabItem.settings: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.folder) {
            // select 'main' tab
            _selectTab(TabItem.folder);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
    
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(TabItem.folder),
            _buildOffstageNavigator(TabItem.allVideos),
            _buildOffstageNavigator(TabItem.favorite),
            _buildOffstageNavigator(TabItem.settings),
          ],
        ),
         bottomNavigationBar: Visibility(
           
           visible: bottomBar,
           child: BottomNavigation(
             
              currentTab: _currentTab,
              onSelectTab: _selectTab,
            ),
         ),
      ),
    );
  }
   Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}