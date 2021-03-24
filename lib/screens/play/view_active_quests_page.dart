import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'card_viewer.dart';

class ViewActiveQuestsPage extends StatelessWidget {
  final GameState state;

  const ViewActiveQuestsPage(this.state);
  @override
  Widget build(BuildContext context) {
    final activeQuests = state.getActiveQuestCards();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Active Quests'),
        ),
        body: ChangeNotifierProvider.value(
            value: state,
            child: Consumer<GameState>(builder: (context, state, _) {
              return Column(children: <Widget>[
                Expanded(child: CardViewer(activeQuests, buttons)),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      )),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close', style: TextStyle(fontSize: 30)),
                    ))
              ]);
            })));
  }

  List<Widget> buttons(context, card) {
    return [];
  }
}
