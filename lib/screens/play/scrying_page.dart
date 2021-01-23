import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/scry_option.dart';
import 'package:treasure_of_the_high_seas/model/view_mode.dart';
import '../../model/card/card.dart' as Model;
import 'card_viewer.dart';

class ScryingPage extends StatelessWidget {
  final GameState state;

  ScryingPage(this.state);

  @override
  Widget build(BuildContext context) {
    final scrying = context.select<GameState, List<Model.Card>>((state) => state.scrying);

    return CardViewer(scrying,
        ViewMode.SCRYING, scryButtons);
  }

  List<Widget> scryButtons(context, card){
    return [_getScryButton(context, card, ScryOption.TOP),
    _getScryButton(context, card, ScryOption.BOTTOM)];
  }

  Widget _getScryButton(
      BuildContext context, Model.Card card, ScryOption scryOption) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width * 0.7,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            Provider.of<GameState>(context, listen: false).replaceScryedCard(card, scryOption);
          },
          color: scryOption.getColour(),
          child:
              Text(scryOption.getDescription(), style: TextStyle(fontSize: 30)),
        ));
  }
}
