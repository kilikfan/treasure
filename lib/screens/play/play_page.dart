import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_model.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/view_mode.dart';
import 'package:treasure_of_the_high_seas/screens/play/scrying_page.dart';
import 'package:treasure_of_the_high_seas/screens/play/game_end_page.dart';
import 'package:treasure_of_the_high_seas/screens/play/view_discard_page.dart';

import './player_hand.dart';
import 'card/card_display.dart';
import 'card/deck_state_panel.dart';

class PlayPage extends StatelessWidget {
  PlayPage(this.title, this.state, {Key key}) : super(key: key);

  final String title;
  final GameState state;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return _onWillPop(context);
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: ChangeNotifierProvider(
                create: (context) => state,
                child: Consumer<GameState>(builder: (context, state, _) {
                  if (state.scrying.isNotEmpty) {
                    return ScryingPage();
                  } else if (state.viewMode == ViewMode.DISCARD) {
                    return ViewDiscardPage();
                  } else if (state.result != null) {
                    return GameEndPage(state.result);
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: (MediaQuery.of(context).size.height) * 0.08,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Center(child: DeckStatePanel()),
                        ),
                        SizedBox(height: 10),
                        Expanded(child: CardDisplay(state.currentCard)),
                        Container(
                          height: (MediaQuery.of(context).size.height) * 0.25,
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: PlayerHand(state.playerHand),
                        ),
                      ],
                    );
                  }
                }))));
  }

  Future<bool> _onWillPop(BuildContext context) async {
    await context.read<AudioModel>().loopMusic(MENU_MUSIC);
    return true;
  }
}
