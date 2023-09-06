import 'package:flutter/material.dart';

import '../widgets/CustomMainButton.dart';
import 'home_page.dart';


class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: _buildGetStartedScreenBody(context),
    );
  }

  Stack _buildGetStartedScreenBody(BuildContext context) {
    return Stack(
     alignment: Alignment.center,
      children: [

        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            "assets/images/photo5.jpg",fit: BoxFit.fill,

          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 620,
            ),







            CustomMainButton(
              text: "Get Started",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
              },
            ),
          ],
        ),
      ],
    );
  }
}

