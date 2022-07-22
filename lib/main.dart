import 'package:bee/presentation/hives/hives_page.dart';
import 'package:flutter/material.dart';

import 'dependecy_injection.dart';

void main() {
  initInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HivesPage(),
    );
  }
}
