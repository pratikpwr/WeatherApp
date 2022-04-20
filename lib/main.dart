import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../src/app.dart';
import '../src/core/utils/app_state_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AppStateNotifier>(
      create: (_) => AppStateNotifier(),
      child: const MyApp(),
    ),
  );
}
