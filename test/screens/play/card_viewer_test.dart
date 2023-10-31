import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/a_game_of_cards.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/a_rival_ship.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/an_island.dart';
import 'package:treasure_of_the_high_seas/model/card/card.dart' as Model;
import 'package:treasure_of_the_high_seas/screens/play/card_viewer.dart';

import '../../test_utils.dart';

void main() {
  List<Widget> getButtons(context, card) {
    return [Text('${card.name} button 1'), Text('${card.name} button 2')];
  }

  final cardList = [const AGameOfCards(), const ARivalShip(), const AnIsland()];

  group('displaying cards should', () {
    testWidgets('show the first card in the list initially',
        (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      await tester.launchWidget(
          child: CardViewer(cardList, getButtons), state: makeGameState());

      _expectOnlyCard(cardList.first.name, cardList);
    });

    testWidgets(
        'show the second card in the list after tapping the right arrow',
        (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      await tester.launchWidget(
          child: CardViewer(cardList, getButtons), state: makeGameState());
      final rightArrow = find.byIcon(Icons.arrow_forward_ios);

      await tester.tap(rightArrow);
      await tester.pumpAndSettle();

      _expectOnlyCard(cardList.elementAt(1).name, cardList);
    });

    testWidgets(
        'loop around to show the first card after tapping the right arrow from the final card',
        (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      await tester.launchWidget(
          child: CardViewer(cardList, getButtons), state: makeGameState());
      final rightArrow = find.byIcon(Icons.arrow_forward_ios);

      await tester.tap(rightArrow);
      await tester.pumpAndSettle();
      await tester.tap(rightArrow);
      await tester.pumpAndSettle();
      await tester.tap(rightArrow);
      await tester.pumpAndSettle();

      _expectOnlyCard(cardList.first.name, cardList);
    });

    testWidgets(
        'loop around to show the last card after tapping the left arrow from the first card',
        (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      await tester.launchWidget(
          child: CardViewer(cardList, getButtons), state: makeGameState());
      final leftArrow = find.byIcon(Icons.arrow_back_ios);

      await tester.tap(leftArrow);
      await tester.pumpAndSettle();

      _expectOnlyCard(cardList.last.name, cardList);
    });
  });

  group('displaying buttons should', () {
    testWidgets('show the provided buttons on the page',
        (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      await tester.launchWidget(
          child: CardViewer(cardList, getButtons), state: makeGameState());

      final button1Finder = find.text('${cardList.first.name} button 1');
      final button2Finder = find.text('${cardList.first.name} button 2');
      expect(button1Finder, findsOneWidget);
      expect(button2Finder, findsOneWidget);
    });

    testWidgets('change the buttons depending on the card being viewed',
        (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      await tester.launchWidget(
          child: CardViewer(cardList, getButtons), state: makeGameState());
      final rightArrow = find.byIcon(Icons.arrow_forward_ios);

      await tester.tap(rightArrow);
      await tester.pumpAndSettle();

      final button1Finder = find.text('${cardList.elementAt(1).name} button 1');
      final button2Finder = find.text('${cardList.elementAt(1).name} button 2');
      expect(button1Finder, findsOneWidget);
      expect(button2Finder, findsOneWidget);
    });
  });

  group('displaying the card numbering should', () {
    testWidgets(
        'show the position of the card currently being viewed in the list of cards',
        (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      await tester.launchWidget(
          child: CardViewer(cardList, getButtons), state: makeGameState());

      final cardNumberFinder = find.text('1 / ${cardList.length}');
      expect(cardNumberFinder, findsOneWidget);
    });

    testWidgets('change the card number after changing the card being viewed',
        (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      await tester.launchWidget(
          child: CardViewer(cardList, getButtons), state: makeGameState());
      final rightArrow = find.byIcon(Icons.arrow_forward_ios);

      await tester.tap(rightArrow);
      await tester.pumpAndSettle();

      final cardNumberFinder = find.text('2 / ${cardList.length}');
      expect(cardNumberFinder, findsOneWidget);
    });
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
  cardList
      .where((card) => card.name != cardName)
      .map((card) => _expectNoCard(card.name));
}
