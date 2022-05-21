import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({
    Key? key,
    required this.weatherCondition,
  }) : super(key: key);
  final String weatherCondition;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          // height: 300,
          constraints: BoxConstraints(maxWidth: 400, maxHeight: 250),
          child: Image.asset(
            weatherCondition == "Rain"
                ? "assets/rainonly.png"
                : weatherCondition == "Clouds"
                    ? "assets/cloud_sun.png"
                    : weatherCondition == "Clear"
                        ? "assets/sunny.png"
                        : "assets/cloud_sun.png",
          )),
    );
  }
}
