import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';
import 'package:treasure_of_the_high_seas/model/audio/audio_model.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/screens/play/scrying_page.dart';
import 'package:treasure_of_the_high_seas/screens/play/game_end_page.dart';

import '../quick_rules_page.dart';
import '../settings_page.dart';
import './player_hand.dart';
import 'card/card_display.dart';
import 'card/deck_state_panel.dart';
import 'view_active_quests_page.dart';

class PlayPage extends StatelessWidget {
  const PlayPage(this.title, this.state, {Key key}) : super(key: key);

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
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.help),
                  tooltip: 'Quick Help',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuickRulesPage()),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.assignment),
                  tooltip: 'Active Quests',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewActiveQuestsPage(state)),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  tooltip: 'Settings',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
              ],
            ),
            body: ChangeNotifierProvider(
                create: (context) => state,
                child: Consumer<GameState>(builder: (context, state, _) {
                  if (state.scrying.isNotEmpty) {
                    return ScryingPage();
                  } else if (state.result != null) {
                    return GameEndPage(state.result);
                  } else {
                    return Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height:
                                  (MediaQuery.of(context).size.height) * 0.07,
                              child: const Center(child: DeckStatePanel()),
                            ),
                            Expanded(child: CardDisplay(state.currentCard)),
                            Container(
                              height:
                                  (MediaQuery.of(context).size.height) * 0.15,
                              child: Column(children: [
                                Expanded(child: PlayerHand(state.playerHand))
                              ]),
                            )
                          ],
                        ));
                  }
                }))));
  }

  Future<bool> _onWillPop(BuildContext context) async {
    await context.read<AudioModel>().loopMusic(MENU_MUSIC);
    return true;
  }
}
