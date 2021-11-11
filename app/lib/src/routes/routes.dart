import 'package:app/src/views/views.dart';
import 'package:flutter/material.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const BottomNavBar());
    default:
      return MaterialPageRoute(builder: (_) => const BottomNavBar());
  }
}
