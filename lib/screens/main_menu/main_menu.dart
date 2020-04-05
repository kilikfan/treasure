import 'package:flutter/material.dart';

import '../play.dart';
import 'menu_button.dart';

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
              MenuButton(
                'Play',
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlayPage(title: 'Play Page')),
                    );
                  }
              ),
              MenuButton(
                'Achievements'
              ),
              MenuButton(
                'Settings'
              ),
              MenuButton(
                'Credits'
              )
            ],
          ),
        ),
      ),
    );
  }
}
