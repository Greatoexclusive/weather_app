import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/services/current_weather_service.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/views/forcast_report/components/next_forecast.dart';
import 'package:weather_app/widgets/today_card.dart';

class ForcastReportView extends StatefulWidget {
  const ForcastReportView({Key? key}) : super(key: key);

  @override
  State<ForcastReportView> createState() => _ForcastState();
}

class _ForcastState extends State<ForcastReportView> {
  var selectedIndex = 0;
  static final WeatherService _forecastWeatherService = WeatherService();
  static final WeatherService _dailyWeatherService = WeatherService();
  List<Map<String, dynamic>> forecastData = [];
  List<Map<String, dynamic>> dailyData = [];

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () => getForecastData());
    Future.delayed(const Duration(seconds: 2), () => getDailyData());
    super.initState();
  }

  getForecastData() async {
    bool isLoading = true;
    setState(() {});

    forecastData = await _forecastWeatherService.getNextForecast();

    setState(() {
      isLoading = false;
    });
  }

  getDailyData() async {
    bool isLoading = true;
    setState(() {});

    dailyData = await _dailyWeatherService.getDailyForecast();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          radius: 2,
          center: Alignment.topRight,
          colors: backgroundColor,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  AppText.heading(
                    "Forecast Report",
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        AppText.headingMeduim("Today"),
                        const Spacer(),
                        AppText.caption(
                          "May 29, 2020",
                          color: Colors.white.withOpacity(0.8),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      ...List.generate(
                        ((forecastData.length) / 5).toInt(),
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: TodayCard(
                            weatherCondition: forecastData[index]["weather"][0]
                                ["main"],
                            time: DateFormat('kk:mm').format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    forecastData[index]["dt"] * 1000)),
                            temp:
                                "${(forecastData[index]["main"]["temp"] - 273).truncate()}",
                            color: index == selectedIndex
                                ? kLightestColor
                                : kLightestColor.withOpacity(0.1),
                          ),
                        ),
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print(dailyData.length);
                          },
                          child: AppText.headingMeduim("Next Forecast"),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.calendar_month,
                          size: 30,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  ...List.generate(
                    dailyData.length,
                    (index) => NextForecastReport(
                      weatherCondition: dailyData[index]["weather"][0]["main"],
                      temp:
                          "${(((dailyData[index]["temp"]["min"]) + ((dailyData[index]["temp"]["max"]))) / 2 - 273).truncate()}",
                      dayOfWeek: DateFormat('EEEE').format(
                        DateTime.fromMillisecondsSinceEpoch(
                            dailyData[index]["dt"] * 1000),
                      ),
                      dayOfMonth: DateFormat('MMMM, dd').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              dailyData[index]["dt"] * 1000)),
                      color: kLightColor.withOpacity(0.1),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
