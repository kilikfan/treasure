import 'action/card_action.dart';

abstract class Card {
  final String name;

  const Card(this.name);

  List<CardAction> getActions();
}