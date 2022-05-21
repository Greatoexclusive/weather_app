import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/image_keys.dart';
import 'package:weather_app/core/constants/weathercondition_keys.dart';
import 'package:weather_app/utils/text.dart';

class NextForecastReport extends StatelessWidget {
  const NextForecastReport(
      {Key? key,
      required this.color,
      required this.weatherCondition,
      required this.dayOfWeek,
      required this.dayOfMonth,
      required this.temp})
      : super(key: key);

  final Color color;
  final String weatherCondition;
  final String dayOfWeek;
  final String dayOfMonth;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      margin: const EdgeInsets.all(18),
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.headingRegular(dayOfWeek),
                AppText.caption(dayOfMonth)
              ]),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.heading(temp),
              AppText.superScript(
                "°C",
              )
            ],
          ),
          Image.asset(
            weatherCondition == WeatherKeys.rainy
                ? ImageKeys.rainy
                : weatherCondition == WeatherKeys.cloudy
                    ? ImageKeys.cloudy
                    : weatherCondition == WeatherKeys.clear
                        ? ImageKeys.clear
                        : ImageKeys.cloudy,
          ),
        ],
      ),
      // child: BackdropFilter(
      //   filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
      // ),
    );
  }
}
