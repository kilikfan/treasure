import 'package:flutter/material.dart';

class CardPile extends StatelessWidget {
  final int pileSize;
  final String pileName;

  CardPile(this.pileSize, this.pileName);

  @override
  Widget build(BuildContext context) {

    final shape = RoundedRectangleBorder(
      side: BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(10),
    );

    return Center(
      child:  Card(
        shape: shape,
        child: Padding(
          padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
          child: Text(
            pileName + ": " + pileSize.toString(),
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ),
    );
  }
}
