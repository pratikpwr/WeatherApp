import 'package:app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({
    Key? key,
    required this.curWeather,
  }) : super(key: key);

  final Current curWeather;

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2.5, crossAxisCount: 2),
      children: [
        HeadingDetailWidget(
            title: "Humidity", value: '${curWeather.humidity}%'),
        HeadingDetailWidget(
            title: "Wind Speed", value: '${curWeather.windSpeed} m/s'),
        HeadingDetailWidget(
            title: "Pressure", value: '${curWeather.pressure} hPa'),
        HeadingDetailWidget(title: "UV", value: '${curWeather.uvi}'),
        HeadingDetailWidget(
            title: "Visibility", value: '${curWeather.visibility} km'),
        HeadingDetailWidget(
            title: "Cloudiness", value: '${curWeather.clouds}%'),
      ],
    );
  }
}

class HeadingDetailWidget extends StatelessWidget {
  final String title;
  final String value;

  const HeadingDetailWidget(
      {Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Styles.subTitleTextStyle(fontSize: 16),
        ),
        Text(
          value,
          style: Styles.titleTextStyle(fontSize: 26),
        ),
      ],
    );
  }
}
