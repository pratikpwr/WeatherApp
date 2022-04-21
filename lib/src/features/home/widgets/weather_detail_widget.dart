import 'package:flutter/material.dart';

import '../models/current_model.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 8),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.7,
        crossAxisCount: 2,
      ),
      children: [
        HeadingDetailWidget(
          title: "Humidity",
          value: '${curWeather.humidity}',
          unit: '%',
        ),
        HeadingDetailWidget(
            title: "Wind Speed", value: '${curWeather.windSpeed}', unit: 'm/s'),
        HeadingDetailWidget(
            title: "Pressure", value: '${curWeather.pressure}', unit: 'hPa'),
        HeadingDetailWidget(title: "UV", value: '${curWeather.uvi}'),
        HeadingDetailWidget(
            title: "Visibility", value: '${curWeather.visibility}', unit: 'km'),
        HeadingDetailWidget(
            title: "Cloudiness", value: '${curWeather.clouds}', unit: '%'),
      ],
    );
  }
}

class HeadingDetailWidget extends StatelessWidget {
  final String title;
  final String value;
  final String unit;

  const HeadingDetailWidget({
    Key? key,
    required this.title,
    required this.value,
    this.unit = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: theme.colorScheme.primaryContainer,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              title,
              style: theme.textTheme.subtitle1
                  ?.copyWith(color: theme.colorScheme.onPrimaryContainer),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: value,
                style: theme.textTheme.headline4
                    ?.copyWith(color: theme.colorScheme.onPrimaryContainer),
              ),
              TextSpan(
                text: ' $unit',
                style: theme.textTheme.headline6
                    ?.copyWith(color: theme.colorScheme.onPrimaryContainer),
              ),
            ])),
          ),
        ],
      ),
    );
  }
}
