import 'package:flutter/material.dart';

import '../../../core/constants/image_const.dart';
import '../../../core/utils/utils.dart';
import '../../../views/widgets/padding.dart';
import '../models/current_model.dart';

class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget({
    Key? key,
    required this.hourWeather,
  }) : super(key: key);

  final List<Current> hourWeather;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return SizedBox(
      height: _size.height * 0.16,
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  Text(
                    getTimeInHour(hourWeather[index].dt),
                    style: theme.textTheme.subtitle1
                        ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                  padding12,
                  Image.asset(
                    ImageAssets.getSmallAsset(
                        hourWeather[index].weather.first.icon),
                    height: _size.height * 0.05,
                  ),
                  padding12,
                  Text(
                    '${hourWeather[index].temp}°',
                    style: theme.textTheme.headline6
                        ?.copyWith(color: theme.colorScheme.onSurface),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
