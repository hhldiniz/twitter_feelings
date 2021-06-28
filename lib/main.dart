import 'package:flutter/material.dart';
import 'package:twitter_feeling/bloc_providers/home_bloc_provider.dart';
import 'package:twitter_feeling/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tweeter Feeling',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeBlocProvider(HomePage()),
    );
  }
}