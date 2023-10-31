import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_model.dart';
import 'package:treasure_of_the_high_seas/model/game_result.dart';
import 'package:treasure_of_the_high_seas/model/game_state_factory.dart';
import 'package:treasure_of_the_high_seas/screens/main_menu/menu_button.dart';
import 'package:treasure_of_the_high_seas/screens/play/play_page.dart';

class GameEndPage extends StatelessWidget {
  final GameResult result;

  const GameEndPage(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
      child: Text(result.description,
          style: const TextStyle(fontSize: 30), textAlign: TextAlign.center),
    );
  }
}
