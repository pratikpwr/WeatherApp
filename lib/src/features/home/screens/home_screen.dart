import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/image_const.dart';
import '../../../core/constants/string_const.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/text_styles.dart';
import '../../../core/utils/utils.dart';
import '../bloc/home_bloc.dart';
import '../widgets/dialy_weather_widget.dart';
import '../widgets/hourly_weather_widget.dart';
import '../widgets/weather_detail_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc()..getLocation(),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeFailed) {
              showSnackBar(context, state.error);
            }
          },
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Loading();
            }
            if (state is HomeSuccess) {
              final weather = state.weatherData;
              return SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        width: _size.width,
                        child: Stack(
                          children: [
                            Positioned(
                              top: -_size.width * 0.23,
                              right: -_size.width * 0.35,
                              child: Image.asset(
                                ImageAssets.getAsset(
                                    weather.current.weather.first.icon),
                                height: _size.height * 0.45,
                              ),
                            ),
                            Container(
                              width: _size.width * 0.5,
                              padding: EdgeInsets.symmetric(
                                  horizontal: _size.width * 0.08,
                                  vertical: _size.height * 0.07),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    state.place,
                                    style: titleTextStyle(fontSize: 22),
                                  ),
                                  spacer(height: 8),
                                  Text(
                                    '${weather.current.temp}°',
                                    style: titleTextStyle(fontSize: 64),
                                  ),
                                  spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: AppColors.lightBackgroundColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      weather.current.weather.first.main,
                                      style: titleTextStyle(fontSize: 16),
                                    ),
                                  ),
                                  spacer(height: _size.height * 0.03)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      WeatherDetailsWidget(curWeather: weather.current),
                      spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.topLeft,
                        child: Text("24 Hours",
                            style: subTitleTextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                      ),
                      spacer(height: 8),
                      HourlyWeatherWidget(hourWeather: weather.hourly),
                      spacer(height: 8),
                      DailyWeatherWidget(dailyWeather: weather.daily)
                    ],
                  ),
                ),
              );
            }
            if (state is HomeFailed) {
              return SomethingWentWrong(message: state.error);
            }
            if (state is HomeLocationNotEnabled) {
              if (state.error == locationDisabledError) {
                return Center(
                  child: Text(
                    'Location services are disabled.\nPlease Restart app after enabling it.',
                    style: subTitleTextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                );
              }
              return SomethingWentWrong(message: state.error);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
