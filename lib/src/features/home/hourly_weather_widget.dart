import 'package:flutter/material.dart';

import '../../core/constants/image_const.dart';
import '../../core/themes/text_styles.dart';
import '../../core/utils/utils.dart';
import 'models/current_model.dart';

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
      height: _size.height * 0.15,
      child: ListView.builder(
          itemCount: hourWeather.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const SizedBox();
            }
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Column(
                children: [
                  Text(
                    getTimeInHour(hourWeather[index].dt),
                    style: titleTextStyle(
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
                    style: titleTextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
