import 'package:flutter/material.dart';
import 'dart:core';

import 'view/home/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      home: HomeView(),
    );
  }
}




