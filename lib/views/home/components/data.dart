import 'package:flutter/material.dart';
import 'package:weather_app/utils/text.dart';

class Data extends StatelessWidget {
  const Data({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText.captionMedium(
          title,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          height: 10,
        ),
        AppText.headingMeduim(value)
      ],
    );
  }
}
