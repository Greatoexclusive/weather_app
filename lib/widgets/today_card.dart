import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/image_keys.dart';
import 'package:weather_app/core/constants/weathercondition_keys.dart';
import 'package:weather_app/utils/text.dart';

class TodayCard extends StatelessWidget {
  const TodayCard(
      {Key? key,
      required this.color,
      required this.time,
      required this.temp,
      required this.weatherCondition})
      : super(key: key);

  final Color color;
  final String time;
  final String temp;
  final String weatherCondition;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      margin: const EdgeInsets.only(left: 15),
      height: 80,
      // width: 150,
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              weatherCondition == WeatherKeys.rainy
                  ? ImageKeys.rainy
                  : weatherCondition == WeatherKeys.cloudy
                      ? ImageKeys.cloudy
                      : weatherCondition == WeatherKeys.clear
                          ? ImageKeys.clear
                          : ImageKeys.cloudy,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppText.headingMeduim(time),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.headingRegular(temp),
                    AppText.superScript(
                      "°C",
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
      // child: BackdropFilter(
      //   filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
      // ),
    );
  }
}
