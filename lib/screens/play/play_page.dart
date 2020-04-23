import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/game_state_factory.dart';
import 'package:treasure_of_the_high_seas/screens/play/scrying_page.dart';

import './current_card/card_display.dart';
import './player_hand.dart';

class PlayPage extends StatelessWidget {
  PlayPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ChangeNotifierProvider(
        create: (context) => startNewGame(),
        child: Consumer<GameState>(
          builder: (context, state, _) {
            if (state.scrying.isNotEmpty) {
              return ScryingPage(state);
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                      child: CardDisplay(state, state.currentCard)
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height) * 0.1,
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.height) * 0.4,
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: PlayerHand(state.playerHand),
                  ),
                ],
              );
            }

          }
        )
      )
    );
  }
}