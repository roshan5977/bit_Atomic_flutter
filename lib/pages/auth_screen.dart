// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:bit_atomic/pages/widgets/login_widget.dart';
import 'package:bit_atomic/pages/widgets/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int value = 0;
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .3,
          color: Color.fromARGB(255, 112, 185, 155),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width * 1,
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    AnimatedToggleSwitch<int>.size(
                      onTap: (props) {},
                      height: 55,
                      current: min(value, 1),
                      style: ToggleStyle(
                        backgroundColor: Color.fromARGB(255, 229, 237, 234),
                        indicatorColor: Color.fromARGB(255, 249, 249, 249),
                        borderColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(50.0),
                        indicatorBorderRadius: BorderRadius.circular(42.0),
                      ),
                      values: const [0, 1],
                      iconOpacity: 1.0,
                      selectedIconScale: 1.0,
                      indicatorSize: Size(180, 46),
                      iconAnimationType: AnimationType.onHover,
                      styleAnimationType: AnimationType.onHover,
                      spacing: 5.0,
                      customSeparatorBuilder: (context, local, global) {
                        final opacity =
                            ((global.position - local.position).abs() - 0.1)
                                .clamp(0.0, 1.0);
                        return VerticalDivider(
                            indent: 10.0,
                            endIndent: 10.0,
                            color: Colors.white38.withOpacity(opacity));
                      },
                      customIconBuilder: (context, local, global) {
                        final text = const ['Login', 'Register'][local.index];
                        return Center(
                            child: Text(text,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color.lerp(
                                        const Color.fromARGB(255, 71, 71, 71),
                                        Colors.black87,
                                        local.animationValue))));
                      },
                      borderWidth: 4.0,
                      onChanged: (i) => setState(() {
                        value = i;
                        isLogin = !isLogin;
                      }),
                    ),
                    isLogin
                        ? Container(
                            width: MediaQuery.of(context).size.width * .9,
                            child: LoginWidget())
                        : Container(
                            width: MediaQuery.of(context).size.width * 1,
                            child: RegisterWidget()),
                  ],
                )),
          ),
        ),
      ],
    ));
  }
}


























// Container(
//           width: 30,
//           height: 30,
//           decoration: BoxDecoration(
//             color: Colors.black,
//             borderRadius: BorderRadius.circular(15),
//           ),
//         child: Icon(Icons.arrow_back_outlined)
//         ),