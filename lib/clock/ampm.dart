// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class MyAmPm extends StatelessWidget {
  bool isItAm;

  MyAmPm({required this.isItAm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
            child: Text(
          isItAm == true ? 'AM' : 'PM',
          style: TextStyle(
              fontSize: 22, color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
