import 'package:app/src/views/widgets/padding.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/image_const.dart';
import '../../../core/utils/utils.dart';
import '../models/daily_model.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget({Key? key, required this.dailyWeather})
      : super(key: key);
  final List<Daily> dailyWeather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dailyWeather.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const SizedBox();
            }
            return DaySummaryWidget(dailyWeather: dailyWeather[index]);
          }),
    );
  }
}

class DaySummaryWidget extends StatelessWidget {
  const DaySummaryWidget({
    Key? key,
    required this.dailyWeather,
  }) : super(key: key);

  final Daily dailyWeather;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: theme.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              getDayFromEpoch(dailyWeather.dt),
              style: theme.textTheme.headline6?.copyWith(
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ),
          ),
          Image.asset(
            ImageAssets.getSmallAsset(dailyWeather.weather.first.icon),
            width: _size.width * 0.09,
          ),
          padding32,
          Text(
            '${dailyWeather.temp.max}°',
            style: theme.textTheme.headline5?.copyWith(
              color: theme.colorScheme.onSecondaryContainer,
            ),
          ),
          padding24,
          Text(
            '${dailyWeather.temp.min}°',
            style: theme.textTheme.headline6?.copyWith(
              color: theme.colorScheme.tertiary,
            ),
          ),
        ],
      ),
    );
  }
}
