// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bit_atomic/clock/clockwheelscroll.dart';
import 'package:bit_atomic/pages/home_screen.dart';
import 'package:flutter/material.dart';

class IntroHomeScreen extends StatefulWidget {
  const IntroHomeScreen({super.key});

  @override
  State<IntroHomeScreen> createState() => _IntroHomeScreenState();
}

class _IntroHomeScreenState extends State<IntroHomeScreen> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: _currentPage == 0
                ? Text(
                    'What time do you usually get up?',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    'What time do you usually end your day?',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.center,
                  ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(25.0, 17.0, 25.0, 0.0),
            child: _currentPage == 0
                ? Text(
                    'Choose the time you usually start a new day ',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 22),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    'We will remind you to finish your checklist before that  ',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
          ),

          //time,
          ClockWheelScroll(),
          SizedBox(
            height: 75,
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage == 1) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
                }
                setState(() {
                  _currentPage++;
                });
              },
              style: ButtonStyle(),
              child: Text('NEXT',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
            ),
          ),
        ],
      ),
    ));
  }
}
