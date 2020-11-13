import 'package:flutter/material.dart';
import 'package:treasure_of_the_high_seas/model/game_pile.dart';

class CardPile extends StatelessWidget {
  final int pileSize;
  final GamePile pileType;

  CardPile(this.pileSize, this.pileType);

  @override
  Widget build(BuildContext context) {

    // TODO - Allow clicking discard pile? final enabled = pileType == GamePile.DISCARD ?? false;
    final enabled = false;

    final shape = RoundedRectangleBorder(
      side: BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(10),
    );

    return Center(
      child:  RaisedButton(
        shape: shape,
        onPressed: enabled ? () {
          // TODO - Allow clicking on discard pile?
        }
            : null,
        child: Text(
          pileType.description + ": " + pileSize.toString(),
          style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
