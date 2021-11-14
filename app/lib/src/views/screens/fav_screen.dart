import 'package:app/src/config/color_const.dart';
import 'package:app/src/config/config.dart';
import 'package:app/src/utils/utils.dart';
import 'package:app/src/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

class FavScreen extends StatelessWidget {
  FavScreen({Key? key}) : super(key: key);
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        // centerTitle: true,
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
        title: SizedBox(
          width: _size.width * 0.7,
          child: TextField(
            controller: _searchController,
            style: Styles.titleTextStyle(fontSize: 18),
            onSubmitted: (value) {
              BlocProvider.of<CityWeatherBloc>(context)
                  .add(SearchCityWeather(value));
            },
            decoration: InputDecoration(
              hintText: 'Search City',
              hintStyle: Styles.subTitleTextStyle(fontSize: 18),
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search_rounded,
                size: 28,
                color: ColorConstants.iconColor,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<CityWeatherBloc>(context)
                    .add(SearchCityWeather(_searchController.text));
              },
              icon: Icon(
                Icons.refresh,
                size: 28,
                color: ColorConstants.iconColor,
              ))
        ],
      ),
      body: BlocListener<CityWeatherBloc, CityWeatherState>(
        listener: (context, state) {
          if (state is CityWeatherFailed) {
            showSnackBar(context, state.error);
          }
        },
        child: BlocBuilder<CityWeatherBloc, CityWeatherState>(
          builder: (context, state) {
            if (state is CityWeatherInitial) {
              return Container(
                height: _size.height * 0.8,
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/3d/02d.png',
                      height: _size.height * 0.25,
                    ),
                    spacer(),
                    Text(
                      'Search the weather \nof the city you want !',
                      textAlign: TextAlign.center,
                      style: Styles.titleTextStyle(
                          fontSize: 28, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              );
            }
            if (state is CityWeatherLoading) {
              return const Loading();
            }
            if (state is CityWeatherSuccess) {
              return SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    width: _size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        spacer(),
                        Image.asset(
                          ImageAssets.getAsset(
                              state.weather.weather.first.icon),
                          height: _size.height * 0.3,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            color: ColorConstants.lightBackgroundColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            state.weather.weather.first.main,
                            style: Styles.titleTextStyle(fontSize: 16),
                          ),
                        ),
                        spacer(height: 12),
                        Text(
                          "${state.weather.name}, ${state.weather.sys.country}",
                          style: Styles.titleTextStyle(fontSize: 22),
                        ),
                        spacer(height: 12),
                        Text(
                          '${state.weather.main.temp}° C',
                          style: Styles.titleTextStyle(fontSize: 54),
                        ),
                        spacer(height: 12),
                        Text(
                          '${state.weather.main.tempMax}° C / ${state.weather.main.tempMin}° C',
                          style: Styles.subTitleTextStyle(fontSize: 18),
                        ),
                        spacer(height: _size.height * 0.05),
                        GridView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 2.5, crossAxisCount: 2),
                          children: [
                            HeadingDetailWidget(
                                title: "Humidity",
                                value: '${state.weather.main.humidity}%'),
                            HeadingDetailWidget(
                                title: "Wind Speed",
                                value: '${state.weather.wind} m/s'),
                            HeadingDetailWidget(
                                title: "Pressure",
                                value: '${state.weather.main.pressure} hPa'),
                            HeadingDetailWidget(
                                title: "Visibility",
                                value: '${state.weather.visibility / 1000} km'),
                            HeadingDetailWidget(
                                title: "Cloudiness",
                                value: '${state.weather.clouds}%'),
                            HeadingDetailWidget(
                                title: "Feels Like",
                                value: '${state.weather.main.feelsLike}'),
                            HeadingDetailWidget(
                                title: "Sunrise",
                                value:
                                    getTimeInHHMM(state.weather.sys.sunrise)),
                            HeadingDetailWidget(
                                title: "Sunset",
                                value: getTimeInHHMM(state.weather.sys.sunset))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            if( state is CityWeatherFailed){
              return const SomethingWentWrong();
            }
            else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
