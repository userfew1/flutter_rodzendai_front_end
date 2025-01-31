import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
}
