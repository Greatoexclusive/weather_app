// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/views/forcast_report/forcast_report_view.dart';
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
  var selectedIndex = 0;
  var selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
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
                        SizedBox(
                          height: 20,
                        ),
                        AppText.heading(
                          "San Fransisco",
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AppText.caption(
                          "May, 29, 2022",
                          color: Colors.white.withOpacity(0.6),
                        ),
                        SizedBox(
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
                                  text:
                                      index == 0 ? "Forecast" : "Air quality"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        WeatherImage(image: "assets/rain_sun.png"),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Data(title: "Temp", value: "30 °"),
                            Data(title: "Wind", value: "100Km/h"),
                            Data(title: "Humidity", value: "75%")
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.all(18),
                          child: Row(
                            children: [
                              AppText.headingMeduim("Today"),
                              Spacer(),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) =>
                                            ForcastReportView()),
                                      ),
                                    );
                                  },
                                  child: AppText.buttonText("View full report"))
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            ...List.generate(
                              8,
                              (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: TodayCard(
                                  color: index == selectedIndex
                                      ? kLightestColor
                                      : kLightestColor.withOpacity(0.1),
                                ),
                              ),
                            )
                          ]),
                        )
                      ],
                    ),
                  ],
                ),
                backgroundColor: Colors.transparent,
              ),
            )));
  }
}
