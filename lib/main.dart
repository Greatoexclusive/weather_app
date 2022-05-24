import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/image_keys.dart';
import 'package:weather_app/utils/allFunctions.dart';
import 'package:weather_app/views/home/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AllFunction _allFunction = AllFunction();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future.wait([
      // preloading asset images
      _allFunction.loadImg(context, ImageKeys.clear),
      _allFunction.loadImg(context, ImageKeys.cloudy),
      _allFunction.loadImg(context, ImageKeys.rainy),
      _allFunction.loadImg(context, ImageKeys.stormy),

      // loadSvg(context, "svg_2.svg"),
    ]);
    return const MaterialApp(title: 'Weatherz Today', home: HomeView());
  }
}
