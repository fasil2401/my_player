import 'package:flutter/material.dart';
import 'package:my_player/Screens/navigation_screens/navigation.dart';
import 'package:my_player/Screens/onboarding/onboarding.dart';
import 'package:my_player/Screens/onboarding/widgets.dart';
import 'package:my_player/Screens/navigation_screens/settings.dart';
import 'package:my_player/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState() {
    checkFirst();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(242, 237, 241, 250),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/vecteezy_stock-vector-abstract-awesome-triangle-and-play-media-with_5533940-removebg-preview.png',
              width: 250,
            ),
            const SizedBox(
              height: 100,
            ),
           const CircularProgressIndicator(
              semanticsLabel: 'linear progress indicator',
              color:  Color.fromARGB(255, 152, 157, 189),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> gotoBoarding() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) =>const OnBoardingScreen()));
  }
  Future<void> checkFirst() async{
    final _sharedPreferences = await SharedPreferences.getInstance();
    final _finishBoarding = _sharedPreferences.getBool(first_time);
    if (_finishBoarding == null || !_finishBoarding) {
      gotoBoarding();
    } 
    else {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) =>const App()));
    }
  }
}

