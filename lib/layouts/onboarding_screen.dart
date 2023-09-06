import 'package:flutter/material.dart';

import 'package:intro_screen_onboarding_flutter/intro_app.dart';

import 'get_started_screen.dart';




class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  static String id = 'OnBoardingScreen';

  final List<Introduction> list = [
    Introduction(
      title: 'Organize Your Tasks ',
      subTitle:
      "Keep your tasks Organized by category priority , or due date  ",
      imageUrl: 'assets/images/photo1.png',
      imageHeight: 250 ,
      imageWidth: 300,

      titleTextStyle:  TextStyle(
        color:Colors.blue[200],
        fontSize: 20,
        fontFamily: 'Gilroy-Heavy',
      ),
      subTitleTextStyle: TextStyle(
        color: Colors.black.withOpacity(0.7),
        fontSize: 16,
        fontFamily: 'Gilroy-Bold',
      ),
    ),
    Introduction(
      title: 'Task Managment  ',
      subTitle:
      "This productive tool is designed to help you better manage your task project-wise conveniently ! ",
      imageUrl: 'assets/images/photo2.png',
      imageHeight: 250 ,
      imageWidth: 300,
      titleTextStyle:  TextStyle(
        color: Colors.blue[200],
        fontSize: 20,
        fontFamily: 'Gilroy-Heavy',
      ),
      subTitleTextStyle: TextStyle(
        color: Colors.black.withOpacity(0.7),
        fontSize: 16,
        fontFamily: 'Gilroy-Bold',
      ),
    ),
    Introduction(
      title: 'Congratulations !',
      subTitle:
      "you are to start using planit to manage your tasks and stay organized . ",
      imageUrl: 'assets/images/photo3.png',
      imageHeight: 250 ,
      imageWidth: 300,
      titleTextStyle: TextStyle(
        color: Colors.blue[200],
        fontSize: 23,
        fontFamily: 'Gilroy-Heavy',
      ),
      subTitleTextStyle: TextStyle(
        color: Colors.black.withOpacity(0.7),
        fontSize: 16,
        fontFamily: 'Gilroy-Bold',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      backgroudColor: Colors.white,
      foregroundColor: Colors.blue[200],
      introductionList: list,
      onTapSkipButton: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const GetStartedScreen(),
        ),
      ),
      skipTextStyle: TextStyle(
        color: Colors.blue[200],
        fontSize: 18,
      ),
    );
  }
}