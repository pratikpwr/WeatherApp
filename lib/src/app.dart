import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/constants/string_const.dart';
import 'core/routes/routes.dart';
import 'core/themes/theme_data.dart';
import 'core/utils/app_state_notifier.dart';
import 'features/city/bloc/city_weather_bloc.dart';
import 'features/history/bloc/history_bloc.dart';
import 'features/home/bloc/home_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeBloc()),
          BlocProvider(create: (context) => HistoryBloc()),
          BlocProvider(create: (context) => CityWeatherBloc()),
        ],
        child: MaterialApp(
          title: appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeConfig.lightTheme,
          darkTheme: ThemeConfig.darkTheme,
          themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          onGenerateRoute: routes,
        ),
      );
    });
  }
}
