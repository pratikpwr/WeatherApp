import 'package:app/src/config/config.dart';
import 'package:app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared/shared.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async {
    Position pos = await determinePosition();
    BlocProvider.of<HomeBloc>(context)
        .add(GetHomeData(lat: 20.8326608, long: 74.168528));
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeFailed) {
            showSnackBar(context, state.error);
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Loading();
            }
            if (state is HomeSuccess) {
              final weather = state.weatherData;
              return SafeArea(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: _size.width * 0.08,
                              vertical: _size.height * 0.07),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                state.place,
                                style: Styles.titleTextStyle(fontSize: 20),
                              ),
                              spacer(height: 8),
                              Text(
                                '${weather.current.temp}°',
                                style: Styles.titleTextStyle(fontSize: 64),
                              ),
                              spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: ColorConstants.lightBackgroundColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Text(
                                  weather.current.weather.first.main,
                                  style: Styles.titleTextStyle(fontSize: 16),
                                ),
                              ),
                              spacer(height: _size.height * 0.2)
                            ],
                          ),
                        ),
                        Positioned(
                          top: -_size.width * 0.23,
                          right: -_size.width * 0.33,
                          child: Image.asset(
                            ImageAssets.getAsset(
                                weather.current.weather.first.icon),
                            height: _size.height * 0.45,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            } else {
              return const SomethingWentWrong();
            }
          },
        ),
      ),
    );
  }
}
