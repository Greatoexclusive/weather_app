import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/utils/text.dart';

class NextForecastReport extends StatelessWidget {
  const NextForecastReport({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      margin: const EdgeInsets.all(12),
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.headingMeduim("Friday"),
                AppText.caption("May 28,")
              ]),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.headingRegular("30"),
              AppText.superScript(
                "°C",
              )
            ],
          ),
          Image.asset(
            "assets/sunny.png",
          ),
        ],
      ),
      // child: BackdropFilter(
      //   filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
      // ),
    );
  }
}
