import 'dart:async';


import 'app_router.dart';
import 'theme/theme.dart';
import 'package:flutter/material.dart';

import 'dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runZoned(() async {
    await initInjector();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.generateAppRoute,
    );
  }
}
