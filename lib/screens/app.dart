import 'package:flutter/material.dart';
import './main_menu/main_menu_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Treasure of the High Seas',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.lightGreen,
      ),
      home: MainMenuPage(),
    );
  }
}
