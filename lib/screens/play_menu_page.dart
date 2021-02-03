import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_model.dart';
import 'package:treasure_of_the_high_seas/model/game_state_factory.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';

import 'play/play_page.dart';
import '../widgets/menu_button.dart';

class PlayMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Menu'),
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
                _startGame(context);
              }),
              MenuButton('Pre-made deck 1', onPressed: () {
                _startGame(context, premadeDeck1());
              }),
              MenuButton('Pre-made deck 2', onPressed: () {
                _startGame(context, premadeDeck2());
              }),
              MenuButton('Debug', onPressed: () {
                _startGame(context, debugScryingGameState());
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _startGame(BuildContext context, [GameState state]) async {
    final audioModel = context.read<AudioModel>();
    await audioModel.loopMusic(GAME_MUSIC);
    state ??= startNewGame();

    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlayPage('Play Page', state)),
    );
  }
}
