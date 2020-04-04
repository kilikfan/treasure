import 'package:flutter/material.dart';
import 'package:treasure_of_the_high_seas/screens/play.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({Key key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treasure of the High Seas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlayPage(title: 'Play Page')),
                );
              },
              child: const Text(
                'Play'
              ),
            )
          ],
        ),
      ),
    );
  }
}
