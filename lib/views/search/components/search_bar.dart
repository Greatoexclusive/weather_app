import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/utils/color.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(10),

          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kLightColor.withOpacity(0.2),
          ),
          margin: const EdgeInsets.all(20),
          height: 50,
          width: MediaQuery.of(context).size.width - 110,
          child: const TextField(
            decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                border: InputBorder.none),
          ),

          // child: BackdropFilter(
          //   filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
          // ),
        ),
        Container(
            padding: const EdgeInsets.all(5),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: kLightColor.withOpacity(0.2),
            ),
            height: 50,
            width: 50,
            child: Icon(
              Icons.pin_drop_outlined,
              color: Colors.white,
            )

            // child: BackdropFilter(
            //   filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
            // ),
            )
      ],
    );
  }
}
