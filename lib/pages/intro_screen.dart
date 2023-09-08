// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bit_atomic/pages/home_screen.dart';
import 'package:bit_atomic/pages/auth_screen.dart';
import 'package:bit_atomic/pages/widgets/sharedpreferences.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Map<String, dynamic>> items = [
    {
      "title": Text(
        'The only way to do great work is to love what you do. What do you love to do?',
        style: TextStyle(
            color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
      "icons": Image.asset(
        "assets/images/MeditatingDoodle.png",
        alignment: Alignment.center,
        fit: BoxFit.cover,
      ),
    },
    {
      "title": Text(
        'The journey of a thousand miles begins with a single step. What step will you take today?',
        style: TextStyle(
            color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
      "icons": Image.asset(
        "assets/images/SleekDoodle.png",
        alignment: Alignment.center,
        fit: BoxFit.cover,
      ),
    },
    {
      "title": Text(
        'Pomodoro Technique is a simple yet effective way to improve your focus and productivity. Wanna start ? ',
        style: TextStyle(
            color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
      "icons": Image.asset(
        "assets/images/SitReadingDoodle.png",
        alignment: Alignment.center,
        fit: BoxFit.cover,
      ),
    },
  ];
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        //move to login page
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => AuthScreen()
                                //  LoginScreen(),
                                ));
                      },
                      child: Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        child: Text(
                          'Skip ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF08BC83),
                              fontSize: MediaQuery.of(context).size.width * .05,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        _currentPage = value;
                      });
                    },
                    children: [
                      for (var item in items)
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              item["icons"],
                              SizedBox(
                                height: 50,
                              ),
                              item["title"],
                            ],
                          ),
                        )
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: _currentPage != 2
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              _pageController.previousPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                              setState(() {
                                --_currentPage;
                              });
                            },
                            child: _currentPage != 0
                                ? Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Color(0xFF08BC83)),
                                    child: Expanded(
                                      // flex: ,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.arrow_back_ios_new_sharp),
                                          Text(
                                            ' Back',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 19,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
                          ),
                          InkWell(
                            onTap: () {
                              _pageController.nextPage(
                                  duration: Duration(milliseconds: 800),
                                  curve: Curves.easeIn);
                              setState(() {
                                ++_currentPage;
                              });
                              print(_pageController.position);
                            },
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Color(0xFF08BC83)),
                              child: Expanded(
                                // flex: ,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Next ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 19,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Icon(Icons.arrow_forward_ios_outlined),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : InkWell(
                        onTap: () {
                          MySharedPref.setGetStartedTrue();

                          //logic for login
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => AuthScreen(),
                          ));
                        },
                        child: Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xFF08BC83)),
                          child: Expanded(
                            // flex: ,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  ' Getting Started',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
              )
            ],
          ),
        ));
  }
}
