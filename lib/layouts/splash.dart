
import 'package:flutter/material.dart';


import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = "SplashScreen";

  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 3500),
          () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => OnBoardingScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body:  const Center(
          child:
          Icon(Icons.check_box, size: 150,color: Colors.white,),
    )
      // AnimatedSplashScreen(
      //   duration: 3500,
      //   splash:
      //   Icon(Icons.check_box, size: 150,color: Colors.white,),
      //
      //   nextScreen: OnBoardingScreen(),
      //   splashTransition: SplashTransition.sizeTransition,
      //
      //   backgroundColor: const Color(0xff8D070F),

        // body: Center(
        //   child:
             // AnimatedSplashScreen(
             //
             //
             // splash:


              // nextScreen: OnBoardingScreen(),
              // splashTransition: SplashTransition.scaleTransition,


          //Icon(Icons.check_box,size: 200,color: Colors.white,),





    );

  }
}