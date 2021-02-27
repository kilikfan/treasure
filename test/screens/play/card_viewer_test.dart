import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/a_game_of_cards.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/a_rival_ship.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/an_island.dart';
import 'package:treasure_of_the_high_seas/model/card/card.dart' as Model;
import 'package:treasure_of_the_high_seas/screens/play/card_viewer.dart';

import '../../test_utils.dart';

void main() {

  List<Widget> getButtons(context, card) {
    return [Text("Test Button 1"), Text("Test Button 2")];
  }
  final List<Model.Card> cardList = [AGameOfCards(), ARivalShip(), AnIsland()];

  testWidgets('the first card in the list should be shown initially', (WidgetTester tester) async {
    await tester.launchWidget(child: CardViewer(cardList, getButtons), state: makeGameState());

    _expectOnlyCard(cardList.first.name, cardList);
  });

  testWidgets('tapping the right arrow should advance the selected card', (WidgetTester tester) async {
    await tester.launchWidget(child: CardViewer(cardList, getButtons), state: makeGameState());
    final rightArrow = find.byIcon(Icons.arrow_forward_ios);

    await tester.tap(rightArrow);
    await tester.pumpAndSettle();

    _expectOnlyCard(cardList.elementAt(1).name, cardList);
  });

  testWidgets('tapping the right arrow when at the last card should loop around to the first card', (WidgetTester tester) async {
    await tester.launchWidget(child: CardViewer(cardList, getButtons), state: makeGameState());
    final rightArrow = find.byIcon(Icons.arrow_forward_ios);

    await tester.tap(rightArrow);
    await tester.pumpAndSettle();
    await tester.tap(rightArrow);
    await tester.pumpAndSettle();
    await tester.tap(rightArrow);
    await tester.pumpAndSettle();

    _expectOnlyCard(cardList.first.name, cardList);
  });

  testWidgets('tapping the left arrow should loop around to the last card', (WidgetTester tester) async {
    await tester.launchWidget(child: CardViewer(cardList, getButtons), state: makeGameState());
    final leftArrow = find.byIcon(Icons.arrow_back_ios);

    await tester.tap(leftArrow);
    await tester.pumpAndSettle();

    _expectOnlyCard(cardList.last.name, cardList);
  });

  testWidgets('the provided buttons should be rendered on the page', (WidgetTester tester) async {
    await tester.launchWidget(child: CardViewer(cardList, getButtons), state: makeGameState());

    final button1Finder = find.text("Test Button 1");
    final button2Finder = find.text("Test Button 2");
    expect(button1Finder, findsOneWidget);
    expect(button2Finder, findsOneWidget);
  });

}

void _expectCard(String cardName) {
  final cardFinder = find.text(cardName);
  expect(cardFinder, findsOneWidget);
}

void _expectNoCard(String cardName) {
  final cardFinder = find.text(cardName);
  expect(cardFinder, findsNothing);
}

void _expectOnlyCard(String cardName, List<Model.Card> cardList) {
  _expectCard(cardName);
  cardList.where((card) => card.name != cardName).map((card) => _expectNoCard(card.name));
}
