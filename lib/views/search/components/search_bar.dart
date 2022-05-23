import 'package:flutter/material.dart';
import 'package:weather_app/services/current_weather_service.dart';
import 'package:weather_app/utils/color.dart';
import 'package:weather_app/utils/text.dart';
import 'package:weather_app/views/home/home_view.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key, required this.isContainer}) : super(key: key);
  final bool isContainer;
  final TextEditingController _controller = TextEditingController();

  final WeatherService _service = WeatherService();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: isContainer == false
                ? BorderRadius.circular(0)
                : BorderRadius.circular(15),
            color: kLightColor.withOpacity(0.2),
          ),
          margin: isContainer == false
              ? const EdgeInsets.all(0)
              : const EdgeInsets.all(20),
          height: 50,
          width: isContainer == false
              ? MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width / 3),
          child: isContainer == true
              ? Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: AppText.headingMeduim(
                          "Search",
                          color: Colors.white.withOpacity(0.7),
                        )),
                  ],
                )
              : TextField(
                  onSubmitted: (value) {
                    value = _controller.text;
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => HomeView(
                                  q: value,
                                ))));
                  },
                  controller: _controller,
                  textInputAction: TextInputAction.search,
                  autofocus: true,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: const TextStyle(
                        fontSize: 18,
                        // fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      suffixIcon: isContainer == true
                          ? const Icon(
                              Icons.search,
                              color: Colors.white,
                            )
                          : GestureDetector(
                              onTap: () => _controller.clear(),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              )),
                      prefixIcon: isContainer == true
                          ? const Icon(
                              Icons.search,
                              color: Colors.white,
                            )
                          : GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                              )),
                      border: InputBorder.none),
                ),
        ),
        Visibility(
          visible: isContainer,
          child: Container(
              padding: const EdgeInsets.all(5),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kLightColor.withOpacity(0.2),
              ),
              height: 50,
              width: 50,
              child: const Icon(
                Icons.pin_drop_outlined,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}
