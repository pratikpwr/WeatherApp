import 'package:flutter/material.dart';

import '../../core/constants/image_const.dart';
import '../../core/themes/text_styles.dart';
import '../../core/utils/utils.dart';
import 'models/daily_model.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget({Key? key, required this.dailyWeather})
      : super(key: key);
  final List<Daily> dailyWeather;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dailyWeather.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const SizedBox();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: _size.width * 0.27,
                      child: Text(
                        getDayFromEpoch(dailyWeather[index].dt),
                        style: subTitleTextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: _size.width * 0.09,
                      child: Image.asset(
                        ImageAssets.getSmallAsset(
                            dailyWeather[index].weather.first.icon),
                        width: _size.width * 0.09,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      '${dailyWeather[index].temp.max}°',
                      style: titleTextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${dailyWeather[index].temp.min}°',
                      style: subTitleTextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ]),
            );
          }),
    );
  }
}
