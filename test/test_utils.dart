import 'package:flutter/material.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/a_rival_ship.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/plunder_a_wreck.dart';
import 'package:treasure_of_the_high_seas/model/card/card.dart' as ModelCard;
import 'package:treasure_of_the_high_seas/model/game_state.dart';
import 'package:treasure_of_the_high_seas/model/game_state_factory.dart';
import 'package:treasure_of_the_high_seas/model/resource.dart';
import 'package:treasure_of_the_high_seas/util/randomiser.dart';

GameState makeGameState(
    {List<ModelCard.Card> deck,
    Randomiser randomiser = const Randomiser(),
    List<Resource> playerHand = INITIAL_RESOURCES,
    ModelCard.Card currentCard}) {
  final deckToUse = deck != null ? deck : [PlunderAWreck(), ARivalShip()];
  final state = GameState(randomiser, deckToUse, playerHand);
  state.currentCard = currentCard;
  return state;
}

Widget createWidgetForTesting({Widget child}) {
  return MaterialApp(
    home: child,
  );
}
