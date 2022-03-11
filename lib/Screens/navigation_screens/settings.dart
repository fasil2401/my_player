import 'package:flutter/material.dart';
import 'package:my_player/Widgets/change_theme_button.dart';
import 'package:my_player/Widgets/custom_appbar.dart';
import 'package:my_player/Widgets/settings_tile.dart';
import 'package:my_player/icons/my_flutter_app_icons.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titletext: 'Settings'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SettingsTile(leadicon: Icons.control_camera,text: 'Theme Mode',tailicon: ChangeThemeButtonWidget(),),
            SettingsTile(leadicon: MyFlutterApp.share,text: 'Share App',),
            SettingsTile(leadicon: MyFlutterApp.info_outline,text: 'About App',),
            SettingsTile(leadicon: MyFlutterApp.notifications,text: 'Notifications',),
          ],
        ),
      ),
    );
  }
}

