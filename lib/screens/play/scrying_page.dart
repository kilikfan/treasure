import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/scry_option.dart';
import '../../model/card/card.dart' as Model;
import 'card_viewer.dart';

class ScryingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scrying =
        context.select<GameState, List<Model.Card>>((state) => state.scrying);

    return CardViewer(scrying, scryButtons);
  }

  List<Widget> scryButtons(context, card) {
    return [
      _getScryButton(context, card, ScryOption.TOP),
      _getScryButton(context, card, ScryOption.BOTTOM)
    ];
  }

  Widget _getScryButton(
      BuildContext context, Model.Card card, ScryOption scryOption) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width * 0.7,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: scryOption.getColour(),
              shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(10),
          )),
          onPressed: () {
            Provider.of<GameState>(context, listen: false)
                .replaceScryedCard(card, scryOption);
          },
          child:
              Text(scryOption.getDescription(), style: const TextStyle(fontSize: 30)),
        ));
  }
}
