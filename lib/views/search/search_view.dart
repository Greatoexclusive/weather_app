import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/views/search/components/cities_card.dart';
import 'package:weather_app/views/search/components/search_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:weather_app/views/search/components/search_page.dart';
import 'package:weather_app/widgets/today_card.dart';

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
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SearchPage()));
                          },
                          child: SearchBar(
                            isContainer: true,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: GridView.custom(
                        semanticChildCount: 2,
                        gridDelegate: SliverStairedGridDelegate(
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 15,
                          pattern: const [
                            StairedGridTile(0.5, 1),
                            StairedGridTile(0.5, 1),
                          ],
                        ),
                        childrenDelegate: SliverChildBuilderDelegate(
                            (context, index) => GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        selectedIndex = index;
                                      },
                                    );
                                  },
                                  child: CitiesCard(
                                    color: index == selectedIndex
                                        ? kLightestColor
                                        : kLightestColor.withOpacity(0.1),
                                  ),
                                ),
                            childCount: 5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
