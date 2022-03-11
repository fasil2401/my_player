import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_player/Screens/navigation_screens/navigation.dart';
import 'package:my_player/Screens/onboarding/widgets.dart';
import 'package:my_player/Screens/navigation_screens/settings.dart';
import 'package:my_player/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Color(0xFF293241),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Image.asset(
              'assets/images/onboard_backg (2).png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            flex: 2,
            child: PageView.builder(
              controller: _controller,
              itemCount: splashData.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    onBoardingImage(context, index),
                    const Spacer(),
                    onBoardingText(index),
                  ],
                );
              },
              onPageChanged: (value) => setState(() => _currentPage = value),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (int index) => _buildDots(index: index),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: SizedBox(
                      height: 62,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: onBoardButton(context),
                    ),
                  ),
                  const Spacer(),
                ],
              ))
        ],
      ),
    );
  }

  ElevatedButton onBoardButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _currentPage + 1 == splashData.length
            ? onBoard(context)
            : _controller.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
              );
      },
      child: Text(
        _currentPage + 1 == splashData.length ? 'Go to app' : 'Next',
        style: const TextStyle(
          fontSize: 26,
          fontFamily: "Poppins",
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF7E9FDC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
    );
  }

  onBoard(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.setBool(first_time, true);
    Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(builder: (context) =>const App()));
  }
}
