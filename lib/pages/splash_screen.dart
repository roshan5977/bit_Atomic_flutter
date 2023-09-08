// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bit_atomic/pages/home_screen.dart';
import 'package:bit_atomic/pages/intro_screen.dart';
import 'package:bit_atomic/pages/auth_screen.dart';
import 'package:bit_atomic/pages/widgets/sharedpreferences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToRequiredPageAfterFewSec();
  }

  void _navigateToRequiredPageAfterFewSec() async {


    var isLogedIn;
    var isgettingStarted;

    
    SharedPreferences.getInstance().then((sharedPreferences) {
      isLogedIn = sharedPreferences.getBool('isLogged');
      if (isLogedIn == null) isLogedIn = false;
      print("inside1");
    });
    SharedPreferences.getInstance().then((sharedPreferences) {
      isgettingStarted = sharedPreferences.getBool('isStarted');
      if (isgettingStarted == null) isgettingStarted = false;
      print("inside2");
    });

    await Future.delayed(Duration(seconds: 3), () {
      print(isLogedIn);
      print(isgettingStarted);

      if (!isgettingStarted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => IntroScreen()));
      } else {
        if (isLogedIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AuthScreen()));
        }
      }

    });

  }

  @override
  Widget build(BuildContext context) {
    final fontstop = GoogleFonts.roboto(
        textStyle: Theme.of(context).textTheme.headlineMedium,
        color: Colors.black87,
        fontWeight: FontWeight.bold,
        fontSize: MediaQuery.of(context).size.width * .05);
    final fontsbottom = GoogleFonts.roboto(
        textStyle: Theme.of(context).textTheme.headlineMedium,
        color: Colors.black87,
        fontWeight: FontWeight.bold,
        fontSize: MediaQuery.of(context).size.width * .05);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
              child: Text(
                'HABIT TRACKER & GOAL PLANNER',
                style: fontstop,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Image.asset(
                "assets/images/icongreenfinal01.png",
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
//icons

            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 35.0),
              child: Text(
                'CREATE GOOD HABITS  AND  BREAK BAD ONES NOW !',
                style: fontsbottom,
                textAlign: TextAlign.center,
              ),
            ),

//line for 3 sec running
            // LoadingAnimationWidget.twistingDots(
            //     leftDotColor: Color(0xFF08BC83),
            //     rightDotColor: Color(0xFF08BC83),
            //     size: 50)
            // LoadingAnimationWidget.dotsTriangle(
            //     color: Color(0xFCBFF48A), size: 70)
          ],
        ),
      ),
    );
  }
}
