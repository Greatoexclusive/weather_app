import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/utils/text.dart';

class CitiesCard extends StatelessWidget {
  const CitiesCard({Key? key, required this.color}) : super(key: key);

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
      // margin: EdgeInsets.all(10),
      height: 50,
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  AppText.headingRegular("30°"),
                  AppText.headingMeduim("Cloudy"),
                ],
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 50),
                child: Image.asset(
                  "assets/sunny.png",
                ),
              ),
            ],
          ),
          AppText.headingRegular("Califonia")
        ],
      ),
      // child: BackdropFilter(
      //   filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
      // ),
    );
  }
}
