import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/utils/text.dart';

class TodayCard extends StatelessWidget {
  const TodayCard({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      margin: EdgeInsets.only(left: 15),
      height: 80,
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            "assets/sunny.png",
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppText.headingMeduim("15:00"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.headingRegular("30"),
                  AppText.superScript(
                    "°C",
                  )
                ],
              )
            ],
          )
        ],
      ),
      // child: BackdropFilter(
      //   filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
      // ),
    );
  }
}
