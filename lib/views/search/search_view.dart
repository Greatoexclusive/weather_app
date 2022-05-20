import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/views/forcast_report/components/next_forecast.dart';
import 'package:weather_app/widgets/today_card.dart';
import 'package:weather_app/views/search/components/search_bar.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
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
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    AppText.heading(
                      "Pick Location",
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Expanded(
                        child: AppText.caption(
                            "Find the area or city you want to know the detailed weather info at this time"),
                      ),
                    ),
                    Row(
                      children: [
                        Center(child: SearchBar()),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
