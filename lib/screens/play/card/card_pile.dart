import 'package:flutter/material.dart';
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/screens/play/view_discard_page.dart';

class CardPile extends StatelessWidget {
  final int pileSize;
  final String pileName;

  final GameState state;

  CardPile(this.pileSize, this.pileName, this.state);

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      side: BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(10),
    );

    final text = Text(
      pileName + ": " + pileSize.toString(),
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
      ),
    );

    return Center(
        child: Card(
            shape: shape,
            child: Padding(
                padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                child: pileName == 'Deck'
                    ? TextButton(child: text)
                    : TextButton(
                        onPressed: pileSize > 0
                            ? () {
                                ViewDiscardPage(state);
                              }
                            : null,
                        child: text))));
  }
}
