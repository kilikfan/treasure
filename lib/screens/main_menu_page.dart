import 'package:flutter/material.dart';
import 'package:treasure_of_the_high_seas/screens/rules_page.dart';
import 'package:treasure_of_the_high_seas/util/resource_loader.dart';

import 'play_menu_page.dart';
import 'settings_page.dart';
import '../widgets/menu_button.dart';

class MainMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treasure of the High Seas'),
      ),
      body: Center(
        child: ButtonTheme(
          height: 100,
          minWidth: (MediaQuery.of(context).size.width) * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MenuButton('Play', onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlayMenuPage()),
                );
              }),
              MenuButton('Settings', onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              }),
              MenuButton('Rules', onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RulesPage(const ResourceLoader())),
                );
              }),
              MenuButton('Credits')
            ],
          ),
        ),
      ),
    );
  }
}
