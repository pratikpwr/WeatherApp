// import 'package:app/src/app.dart';
// import 'package:app/src/views/screens/fav_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:shared/modules/city/bloc/city_weather_bloc.dart';
//
// void main() {
//   testWidgets('City weather is loaded State', (WidgetTester tester) async {
//     // Assemble
//     await tester.pumpWidget(BlocProvider(
//       create: (ctx) => CityWeatherBloc(),
//       child: MaterialApp(home: FavScreen()),
//     ));
//
//     final _bloc = CityWeatherBloc();
//     final textField = find.byType(TextField);
//     await tester.enterText(textField, "Nashik");
//
//     final button = find.byKey(const ValueKey('refresh'));
//     // _bloc.add(SearchCityWeather("Nashik"));
//
//     // Act
//     await tester.tap(button);
//     await tester.pump();
//
//     // Assert
//     final text = find.text('Search City');
//     expect(text, findsOneWidget);
//   });
// }
