import 'package:flutter/material.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/text.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key, required this.children}) : super(key: key);
  late List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.2),
        ),
        height: 40,
        width: 240,
        child: Row(
          children: children,
        ),
      ),
    );
  }
}
