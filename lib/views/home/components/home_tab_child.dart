import 'package:flutter/material.dart';
import 'package:weather_app/utils/text.dart';

class HomeTabChild extends StatelessWidget {
  HomeTabChild({Key? key, required this.color, required this.text})
      : super(key: key);
  late String text;
  late Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      child: Center(child: AppText.headingMeduim(text)),
    );
  }
}
