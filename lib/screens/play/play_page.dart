import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/screens/play/scrying_page.dart';
import 'package:treasure_of_the_high_seas/screens/play/game_end_page.dart';

import './player_hand.dart';
import 'card/card_display.dart';

class PlayPage extends StatelessWidget {
  PlayPage(this.title, this.state, {Key key}) : super(key: key);

  final String title;
  final GameState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ChangeNotifierProvider(
            create: (context) => state,
            child: Consumer<GameState>(builder: (context, state, _) {
              if (state.scrying.isNotEmpty) {
                return ScryingPage(state);
              } else if (state.result != null) {
                return GameEndPage(state.result);
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Expanded(child: CardDisplay(state, state.currentCard)),
                    Container(
                      height: (MediaQuery.of(context).size.height) * 0.25,
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: PlayerHand(state.playerHand),
                    ),
                  ],
                );
              }
            })));
  }
}
