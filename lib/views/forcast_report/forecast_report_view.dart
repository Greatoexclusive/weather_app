import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/services/current_weather_service.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/views/forcast_report/components/next_forecast.dart';
import 'package:weather_app/widgets/today_card.dart';

class ForcastReportView extends StatefulWidget {
  ForcastReportView(
      {Key? key, required this.dailyData, required this.forecastData})
      : super(key: key);

  final List<Map<String, dynamic>> forecastData;
  final List<Map<String, dynamic>> dailyData;

  @override
  State<ForcastReportView> createState() => _ForcastState();
}

class _ForcastState extends State<ForcastReportView> {
  var selectedIndex = 0;

  @override
  void initState() {
    super.initState();
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
        filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              // color: kLightestColor,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        AppText.heading(
                          "Forecast Report",
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
                            child: const InkWell(
                              child: Icon(
                                Icons.more_vert_outlined,
                                color: Colors.transparent,
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
                        ((widget.forecastData.length) / 5).toInt(),
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: TodayCard(
                            weatherCondition: widget.forecastData[index]
                                ["weather"][0]["main"],
                            time: DateFormat('kk:mm').format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    widget.forecastData[index]["dt"] * 1000)),
                            temp:
                                "${(widget.forecastData[index]["main"]["temp"] - 273).truncate()}",
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
                          onTap: () {},
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
                    widget.dailyData.length,
                    (index) => NextForecastReport(
                      weatherCondition: widget.dailyData[index]["weather"][0]
                          ["main"],
                      temp:
                          "${(((widget.dailyData[index]["temp"]["min"]) + ((widget.dailyData[index]["temp"]["max"]))) / 2 - 273).truncate()}",
                      dayOfWeek: DateFormat('EEEE').format(
                        DateTime.fromMillisecondsSinceEpoch(
                            widget.dailyData[index]["dt"] * 1000),
                      ),
                      dayOfMonth: DateFormat('MMMM, dd').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              widget.dailyData[index]["dt"] * 1000)),
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
