import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/src/app.dart';
import 'package:app/src/utils/utils.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AppStateNotifier>(
      create: (_) => AppStateNotifier(),
      child: const MyApp(),
    ),
  );
}
