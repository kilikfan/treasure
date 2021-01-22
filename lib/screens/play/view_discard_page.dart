import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/view_mode.dart';
import 'package:treasure_of_the_high_seas/screens/play/play_page.dart';
import '../../model/card/card.dart' as Model;
import 'card_viewer.dart';

class ViewDiscardPage extends StatelessWidget {
  final GameState state;

  ViewDiscardPage(this.state);

  @override
  Widget build(BuildContext context) {
    final discard = context.select<GameState, List<Model.Card>>((state) => state.discard);

    return CardViewer(discard,
        ViewMode.DISCARD, closeButton);
  }

  Function closeButton(context, card, components){
    components = [_getCloseButton(context, card)];
  }

  Widget _getCloseButton(
      BuildContext context, Model.Card card) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width * 0.7,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            // TODO - Provider.of<GameState>(context, listen: false);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlayPage("Play Page", state)),
            );
          },
          color: Colors.green,
          child:
              Text("Close", style: TextStyle(fontSize: 30)),
        ));
  }
}
