import 'package:colina_pages/pages/Login.dart';
import 'package:colina_pages/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.cyan,
      accentColor: Colors.deepPurple,
      textTheme: TextTheme(
        headline5: TextStyle(
          fontSize: 72.0,
          fontWeight: FontWeight.bold
        ),
        headline6: TextStyle(
          fontSize: 36.0,
          fontStyle: FontStyle.italic
        ),
        bodyText2: TextStyle(
          fontSize: 18.0,
        ),
      ),
    ),
    home: Login(),
    routes: routes,
  ));
}