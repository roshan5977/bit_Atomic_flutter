import 'package:bit_atomic/clock/ampm.dart';
import 'package:bit_atomic/clock/hours.dart';
import 'package:bit_atomic/clock/minutes.dart';
import 'package:bit_atomic/clock/mytile.dart';
import 'package:flutter/material.dart';

class ClockWheelScroll extends StatefulWidget {
  const ClockWheelScroll({super.key});

  @override
  State<ClockWheelScroll> createState() => _ClockWheelScrollState();
}

class _ClockWheelScrollState extends State<ClockWheelScroll> {
  late FixedExtentScrollController _controller = FixedExtentScrollController();

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController();
  }

  int currentHour = 0;
  int currentMinute = 0;
  int amOrPm = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: 400,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: 70,
            child: ListWheelScrollView.useDelegate(
              controller: _controller,
              onSelectedItemChanged: (value) {
                setState(() {
                  currentHour = value;
                });
              },
              itemExtent: 30,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 13,
                builder: (context, index) {
                  return MyHours(hours: index);
                },
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 70,
            child: ListWheelScrollView.useDelegate(
              onSelectedItemChanged: (value) {
                setState(() {
                  currentMinute = value;
                });
              },
              itemExtent: 30,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 61,
                builder: (context, index) {
                  return MyMinutes(mins: index);
                },
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 70,
            child: ListWheelScrollView.useDelegate(
              onSelectedItemChanged: (value) {
                setState(() {
                  amOrPm = value;
                });
              },
              itemExtent: 30,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 2,
                builder: (context, index) {
                  if (index == 0) {
                    return MyAmPm(isItAm: true);
                  } else {
                    return MyAmPm(isItAm: false);
                  }
                },
              ),
            ),
          ),
        ]));
  }
}



















// Container(
//       height: 400,
//       width: 300,
//       color: const Color.fromARGB(255, 28, 40, 34),
//       child: ListWheelScrollView(itemExtent: 50,
//       perspective:0.009 ,
//       diameterRatio: 1.8,
//        children: [
       
//       ]),
//     );