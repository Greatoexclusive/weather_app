import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/utils/color.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 2,
            center: Alignment.topRight,
            colors: [
              kLightestColor,
              kLightColor,
              kMediumColor,
              kMediumColor,
              kDarkColor,
              kDarkColor,
              kDarkColor,
              kDarkestColor,
              kDarkestColor,
              // Colors.black
            ],
          ),
        ),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
            child: const Scaffold(
              backgroundColor: Colors.transparent,
            )));
  }
}
