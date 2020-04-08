import 'package:flutter/material.dart';

import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';
import 'package:treasure_of_the_high_seas/util/list_shuffler.dart';

import './player_hand.dart';

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
    
    gameState = GameState(const ListShuffler(), null);

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
  }

  void _addMapPressed() {
    setState(() {
      gameState.playerHand.addResources([Resource.MAP]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PlayerHand(gameState.playerHand)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMapPressed,
        tooltip: 'Add Map',
        child: Icon(Icons.add),
      ),
    );
  }
}