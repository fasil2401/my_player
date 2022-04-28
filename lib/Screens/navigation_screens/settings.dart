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
            // SettingsTile(leadicon: Icons.control_camera,text: 'Theme Mode',tailicon: ChangeThemeButtonWidget(),),
            SettingsTile(
              leadicon: MyFlutterApp.share,
              text: 'Share App',
            ),
            GestureDetector(
              onTap: () {
                _aboutUs();
              },
              child: SettingsTile(
                leadicon: MyFlutterApp.info_outline,
                text: 'About App',
              ),
            ),
            SettingsTile(
              leadicon: Icons.rate_review_outlined,
              text: 'Write a review',
            ),
            SettingsTile(
              leadicon: Icons.star_border_outlined,
              text: 'Rate App',
            ),
          ],
        ),
      ),
    );
  }

  void _aboutUs() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Center(
              child: Text(
            'About Me',
            style: TextStyle(fontFamily: "Poppins", fontSize: 21, fontWeight: FontWeight.bold),
          )),
          content: Text( 
            'I am Salman Salim from Kerala, India. I am passionate in building application. This app is developed in Flutter',
            textAlign: TextAlign.center,
            style: TextStyle(
              
              fontFamily: "Poppins", 
              fontSize: 18, ),
          ),
        );
      },
    );
  }
}
