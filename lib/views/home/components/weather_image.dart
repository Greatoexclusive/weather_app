import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          // height: 300,
          constraints: BoxConstraints(maxWidth: 400, maxHeight: 250),
          child: Image.asset(
            image,
          )),
    );
  }
}
