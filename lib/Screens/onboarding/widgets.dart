import 'package:flutter/material.dart';

final List<Map<String, String>> splashData = [
  {
    "title": "One Stop Solution for your\nMultimedia Play",
    "image": "assets/images/5870-removebg-preview (1).png"
  },
  {
    "title": "Wolcome to the world of\nEverytainment",
    "image": "assets/images/13134-removebg-preview (1).png"
  },
  {
    "title": "One Stop Solution for your\nMultimedia Play",
    "image": "assets/images/5870-removebg-preview (1).png"
  },
  {
    "title": "One Stop Solution for your\nMultimedia Play",
    "image": "assets/images/5870-removebg-preview (1).png"
  },

  // {

  //   "title":
  //       "Do your best in your day to day life\nand unlock achievements",
  //   "image": "assets/images/boarding3.png"
  // },
];

SizedBox onBoardingImage(BuildContext context, int index) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * .18,
    width: MediaQuery.of(context).size.width * .6,
    child: AspectRatio(
      aspectRatio: 9 / 16,
      child: Image.asset(
        splashData[index]['image']!,
        fit: BoxFit.fill,
      ),
    ),
  );
}

Text onBoardingText(BuildContext context, int index) {
  return Text(
    splashData[index]['title']!,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontFamily: "Poppins",
      fontSize: MediaQuery.of(context).size.height * .03,
      color: const Color.fromARGB(255, 37, 37, 37),
      height: 1.5,
    ),
  );
}
