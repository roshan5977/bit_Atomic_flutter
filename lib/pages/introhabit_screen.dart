import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroHabitScreen extends StatefulWidget {
  const IntroHabitScreen({super.key});

  @override
  State<IntroHabitScreen> createState() => _IntroHabitScreenState();
}

class _IntroHabitScreenState extends State<IntroHabitScreen> {
  @override
  Widget build(BuildContext context) {
    final buttomTextStyle = GoogleFonts.kameron(
        textStyle: Theme.of(context).textTheme.titleMedium,
        color: Colors.white,
        fontSize: 30);

    Map<int, String> habitmap = new HashMap();
    habitmap.putIfAbsent(1, () => "MEDITATION",);
       habitmap.putIfAbsent(1, () => "WORKOUT",);
       habitmap.putIfAbsent(1, () => "MEDITATION",);
       habitmap.putIfAbsent(1, () => "MEDITATION",);
       habitmap.putIfAbsent(1, () => "MEDITATION",);





    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
            child: Text(
              'Choose the first habit that you’d like to build ',
              style: buttomTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ));
  }
}



// final planets = <int, String>{1: 'Mercury', 2: 'Venus',
//   3: 'Earth', 4: 'Mars'};
// final gasGiants = <int, String>{5: 'Jupiter', 6: 'Saturn'};
// final iceGiants = <int, String>{7: 'Uranus', 8: 'Neptune'};
// planets.addEntries(gasGiants.entries);
// planets.addEntries(iceGiants.entries);
// print(planets);