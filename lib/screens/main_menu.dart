import 'package:flutter/material.dart';

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
            const RaisedButton(
              onPressed: null,
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
