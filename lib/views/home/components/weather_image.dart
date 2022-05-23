import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/image_keys.dart';
import 'package:weather_app/core/constants/weathercondition_keys.dart';

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
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 250),
        child: Image.asset(
          weatherCondition == WeatherKeys.rainy
              ? ImageKeys.rainy
              : weatherCondition == WeatherKeys.cloudy
                  ? ImageKeys.cloudy
                  : weatherCondition == WeatherKeys.clear
                      ? ImageKeys.clear
                      : ImageKeys.cloudy,
        ),
      ),
    );
  }
}
