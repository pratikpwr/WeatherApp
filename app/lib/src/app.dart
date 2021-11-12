import 'package:app/src/config/config.dart';
import 'package:app/src/routes/routes.dart';
import 'package:app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared/shared.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeBloc()),
        ],
        child: MaterialApp(
          title: appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeConfig.myLightTheme,
          darkTheme: ThemeConfig.darkTheme,
          themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          onGenerateRoute: routes,
        ),
      );
    });
  }
}
