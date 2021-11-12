import 'package:app/src/config/config.dart';
import 'package:app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget({
    Key? key,
    required this.hourWeather,
  }) : super(key: key);

  final List<Current> hourWeather;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SizedBox(
      height: _size.height * 0.2,
      child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Column(
                children: [
                  Text(
                    getTimeInHour(hourWeather[index].dt),
                    style: Styles.titleTextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  spacer(height: 10),
                  Image.asset(
                    ImageAssets.getSmallAsset(
                        hourWeather[index].weather.first.icon),
                    height: _size.height * 0.05,
                  ),
                  spacer(height: 10),
                  Text(
                    '${hourWeather[index].temp}°',
                    style: Styles.titleTextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
