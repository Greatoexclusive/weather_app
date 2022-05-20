import 'dart:ui';

import 'package:flutter/material.dart';
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
                  AppText.heading(
                    "Forecast Report",
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        AppText.headingMeduim("Today"),
                        const Spacer(),
                        AppText.caption("May 29, 2020")
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        AppText.headingMeduim("Next Forecast"),
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
                    6,
                    (index) => NextForecastReport(
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
