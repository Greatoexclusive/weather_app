import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/allFunctions.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/views/forcast_report/forecast_report_view.dart';
import 'package:weather_app/views/home/components/data.dart';
import 'package:weather_app/views/home/components/home_tab.dart';
import 'package:weather_app/views/home/components/home_tab_child.dart';
import 'package:weather_app/views/search/search_view.dart';
import 'package:weather_app/widgets/today_card.dart';
import 'package:weather_app/views/home/components/weather_image.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, this.q}) : super(key: key);
  final String? q;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // services inititialization
  static final AllFunction _allFunction = AllFunction();

  //variables to hold each data to be displayed

  @override
  void initState() {
    _allFunction.currentData = {};
    setState(() {});
    Future.delayed(
      const Duration(seconds: 2),
      () {
        init(widget.q);
      },
    );
    print("this is from home");
    super.initState();
  }

  init(q) async {
    setState(() {});
    await _allFunction.getCurrentData(q);
    await _allFunction.getForecastData(q);
    await _allFunction.getDailyData(q);

    setState(() {});
  }

  var selectedIndex = 0;
  var selectedTabIndex = 0;
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
        filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
        child: SafeArea(
          child: _allFunction.currentData.isEmpty ||
                  _allFunction.forecastData.isEmpty ||
                  _allFunction.dailyData.isEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultTextStyle(
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      child: const Text('Fetching Weather Reports...'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const CircularProgressIndicator(),
                  ],
                )
              : Scaffold(
                  body: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SearchView(
                                                  city: {
                                                    "name": _allFunction
                                                        .currentData["name"],
                                                    "temp":
                                                        "${(_allFunction.currentData["main"]["temp"] - 273).truncate()}°C",
                                                    "condition": _allFunction
                                                            .currentData[
                                                        "weather"][0]["main"]
                                                  },
                                                )));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      // color: kLightestColor,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                AppText.heading(
                                  _allFunction.currentData["name"],
                                  color: Colors.white,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      // color: kLightestColor,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        _allFunction.currentData = {};
                                        init(widget.q);
                                      },
                                      child: const Icon(
                                        Icons.refresh,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppText.caption(
                            DateFormat('MMMM, dd, yyyy – H:m').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  _allFunction.currentData["dt"] * 1000),
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
                              weatherCondition: _allFunction
                                  .currentData["weather"][0]["main"]),
                          const SizedBox(
                            height: 30,
                          ),
                          AppText.headingMeduim(
                              "Weather condition: ${_allFunction.currentData["weather"][0]["description"]}"),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Data(
                                title: "Temp",
                                value:
                                    "${(_allFunction.currentData["main"]["temp"] - 273).truncate()}°C",
                              ),
                              Data(
                                  title: "Pressure",
                                  value:
                                      "${((_allFunction.currentData["main"]["pressure"]) / 33.86).truncate()}Hg"),
                              Data(
                                  title: "Humidity",
                                  value:
                                      "${(_allFunction.currentData["main"]["humidity"])}%")
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
                                            ForcastReportView(
                                                dailyData:
                                                    _allFunction.dailyData,
                                                forecastData:
                                                    _allFunction.forecastData)),
                                      ),
                                    );
                                  },
                                  child: AppText.buttonText("View full report"),
                                )
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...List.generate(
                                  ((_allFunction.forecastData.length) ~/ 5),
                                  (index) => GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          selectedIndex = index;
                                        },
                                      );
                                    },
                                    child: TodayCard(
                                      weatherCondition:
                                          _allFunction.forecastData[index]
                                              ["weather"][0]["main"],
                                      time: DateFormat('kk:mm a').format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            _allFunction.forecastData[index]
                                                    ["dt"] *
                                                1000),
                                      ),
                                      temp:
                                          "${(_allFunction.forecastData[index]["main"]["temp"] - 273).truncate()}",
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
                      const SizedBox(
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
