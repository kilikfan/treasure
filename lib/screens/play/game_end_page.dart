import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_model.dart';
import 'package:treasure_of_the_high_seas/model/game_result.dart';
import 'package:treasure_of_the_high_seas/model/game_state_factory.dart';
import 'package:treasure_of_the_high_seas/screens/main_menu/menu_button.dart';
import 'package:treasure_of_the_high_seas/screens/play/play_page.dart';

import '../main_menu/menu_button.dart';

class GameEndPage extends StatelessWidget {
  final GameResult result;

  const GameEndPage(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButtonTheme(
          data: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).accentColor,
                  minimumSize:
                      Size((MediaQuery.of(context).size.width) * 0.8, 100))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _getText(context, result),
              MenuButton('New Game', onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PlayPage('Play Page', startNewGame())),
                );
              }),
              MenuButton('Exit', onPressed: () async {
                await context.read<AudioModel>().loopMusic(MENU_MUSIC);
                Navigator.of(context).pop();
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget _getText(BuildContext context, GameResult result) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(result.description, style: const TextStyle(fontSize: 30)),
    );
  }
}
