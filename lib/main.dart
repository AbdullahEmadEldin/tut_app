import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /// Making the MyApp a singleton to ensure that there is only one entry point of the application through it's life cycle.
  /// and to enable use it in di or state management.
  const MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Container(),
    );
  }
}
