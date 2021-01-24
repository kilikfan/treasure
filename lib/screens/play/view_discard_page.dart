import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import '../../model/card/card.dart' as Model;
import 'card_viewer.dart';

class ViewDiscardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final discard = context.select<GameState, List<Model.Card>>((state) => state.discard);

    return CardViewer(discard, closeButton);
  }

  List<Widget> closeButton(context, card){
    return [_getCloseButton(context, card)];
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
            context.read<GameState>().toggleDiscardView(closeWindow: true);
          },
          color: Colors.green,
          child:
              Text("Close", style: TextStyle(fontSize: 30)),
        ));
  }
}
