import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  

  static setGetStartedTrue() async {
    await SharedPreferences.getInstance().then((sharedPreferences) {
      sharedPreferences.setBool("isStarted", true);
      print(sharedPreferences.getBool("isStarted"));
    });
  }

  static setloggedInTrue() async {
    await SharedPreferences.getInstance().then((sharedPreferences) {
      sharedPreferences.setBool("isLogged", true);
    });
  }








  // void logout() {
  //   SharedPreferences.getInstance().then((sharedPreferences) {
  //     sharedPreferences.remove(key);
  //   });
  // }
}
