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
        child: ButtonTheme(
          height: 100,
          minWidth: (MediaQuery.of(context).size.width) * 0.8,       
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlayPage(title: 'Play Page')),
                    );
                  },
                  color: Colors.green,
                  child: const Text(
                    'Play',
                    style: TextStyle(fontSize: 30)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: null,
                  child: const Text(
                    'Achievements',
                    style: TextStyle(fontSize: 30)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: null,
                  child: const Text(
                    'Settings',
                    style: TextStyle(fontSize: 30)
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
