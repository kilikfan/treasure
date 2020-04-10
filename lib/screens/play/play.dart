import 'package:flutter/material.dart';

import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';
import 'package:treasure_of_the_high_seas/util/list_shuffler.dart';

// Define alias to avoid clash with the material.dart Card Widget
import 'package:treasure_of_the_high_seas/model/card/card.dart' as GameCard;
import 'package:treasure_of_the_high_seas/model/card/a_rival_ship.dart';
import 'package:treasure_of_the_high_seas/model/card/plunder_a_wreck.dart';

import './player_hand.dart';
import './current_card/current_card.dart';

class PlayPage extends StatefulWidget {
  PlayPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  GameState gameState;

  @override
  void initState(){
    super.initState();
    
    gameState = GameState(const ListShuffler(), _getInitialDeck());

    gameState.playerHand.addResources([
      Resource.CREW,
      Resource.CREW,
      Resource.LANDLUBBER,
      Resource.LANDLUBBER,
      Resource.FOOD,
      Resource.FOOD,
      Resource.DOUBLOON,
      Resource.DOUBLOON,
    ]);

    gameState.nextCard();
  }

  List<GameCard.Card> _getInitialDeck() {
    return [
      PlunderAWreck(),
      ARivalShip()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Center(
              child: CurrentCard(gameState.currentCard)
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height) * 0.2,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: PlayerHand(gameState.playerHand),
            ),
          ],
        ),
    );
  }
}