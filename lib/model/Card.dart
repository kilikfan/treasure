import 'CardAction.dart';

abstract class Card {
  final String name;

  Card(this.name);

  List<CardAction> getActions();
}