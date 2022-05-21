import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/services/current_weather_service.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/views/forcast_report/forecast_report_view.dart';
import 'package:weather_app/views/home/components/data.dart';
import 'package:weather_app/views/home/components/home_tab.dart';
import 'package:weather_app/views/home/components/home_tab_child.dart';
import 'package:weather_app/widgets/today_card.dart';
import 'package:weather_app/views/home/components/weather_image.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Map<String, dynamic> currentData = {};
  List<Map<String, dynamic>> forecastData = [];
  static final WeatherService _currentWeatherService = WeatherService();
  static final WeatherService _forecastWeatherService = WeatherService();

  void initState() {
    Future.delayed(const Duration(seconds: 2), () => getCurrentData());
    Future.delayed(const Duration(seconds: 2), () => getForecastData());
    super.initState();
  }

  getCurrentData() async {
    bool isLoading = true;
    setState(() {});

    currentData = await _currentWeatherService.getCurrentData();

    setState(() {
      isLoading = false;
    });
  }

  getForecastData() async {
    bool isLoading = true;
    setState(() {});

    forecastData = await _forecastWeatherService.getNextForecast();

    setState(() {
      isLoading = false;
    });
  }

  var selectedIndex = 0;
  var selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return currentData.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                radius: 2,
                center: Alignment.topRight,
                colors: backgroundColor,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
              child: SafeArea(
                child: Scaffold(
                  body: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          AppText.heading(
                            currentData["name"],
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppText.caption(
                            DateFormat('MMMM, dd, yyyy – H:m').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  currentData["dt"] * 1000),
                            ),
                            color: Colors.white.withOpacity(0.6),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          HomeTab(
                            children: List.generate(
                              2,
                              (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedTabIndex = index;
                                  });
                                },
                                child: HomeTabChild(
                                    color: selectedTabIndex == index
                                        ? kLightestColor
                                        : Colors.transparent,
                                    text: index == 0
                                        ? "Forecast"
                                        : "Air quality"),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          WeatherImage(
                              weatherCondition: currentData["weather"][0]
                                  ["main"]),
                          const SizedBox(
                            height: 30,
                          ),
                          AppText.headingMeduim(
                              "Weather condition: ${currentData["weather"][0]["description"]}"),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Data(
                                title: "Temp",
                                value:
                                    "${(currentData["main"]["temp"] - 273).truncate()}°C",
                              ),
                              Data(
                                  title: "Pressure",
                                  value:
                                      "${((currentData["main"]["pressure"]) / 33.86).truncate()}Hg"),
                              Data(
                                  title: "Humidity",
                                  value:
                                      "${(currentData["main"]["humidity"])}%")
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              children: [
                                AppText.headingMeduim("Today"),
                                const Spacer(),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: ((context) =>
                                              const ForcastReportView()),
                                        ),
                                      );
                                    },
                                    child:
                                        AppText.buttonText("View full report"))
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...List.generate(
                                  ((forecastData.length) ~/ 5),
                                  (index) => GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          selectedIndex = index;
                                        },
                                      );
                                    },
                                    child: TodayCard(
                                      weatherCondition: forecastData[index]
                                          ["weather"][0]["main"],
                                      time: DateFormat('kk:mm').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              forecastData[index]["dt"] *
                                                  1000)),
                                      temp:
                                          "${(forecastData[index]["main"]["temp"] - 273).truncate()}",
                                      color: index == selectedIndex
                                          ? kLightestColor
                                          : kLightestColor.withOpacity(0.1),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          );
  }
}
