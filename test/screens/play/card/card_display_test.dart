import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/plunder_a_wreck.dart';
import 'package:treasure_of_the_high_seas/model/card/card_types.dart';
import 'package:treasure_of_the_high_seas/model/card/quest/hispaniola_1_rumours_of_an_island.dart';
import 'package:treasure_of_the_high_seas/model/card/special/mutiny.dart';
import 'package:treasure_of_the_high_seas/model/card/special_card_types.dart';
import 'package:treasure_of_the_high_seas/screens/play/card/card_display.dart';
import 'package:treasure_of_the_high_seas/screens/play/card/card_header.dart';

import '../../../test_utils.dart';

void main() {
  testWidgets('should change colour based on the card type displayed',
      (WidgetTester tester) async {
    final cardFinder = find.byType(Card);

    await tester.launchWidget(
        child: CardDisplay(PlunderAWreck()), state: makeGameState());
    final basicCard = tester.widget<Card>(cardFinder);
    expect(basicCard.color, basicCardColour);

    await tester.launchWidget(
        child: CardDisplay(RumoursOfAnIsland()), state: makeGameState());
    final questCard = tester.widget<Card>(cardFinder);
    expect(questCard.color, questCardColour);

    await tester.launchWidget(
        child: CardDisplay(Mutiny()), state: makeGameState());
    final specialCard = tester.widget<Card>(cardFinder);
    expect(specialCard.color, specialCardColour);
  });

  group('Sub Heading Tests', () {
    testWidgets('should display no sub heading for a basic card',
        (WidgetTester tester) async {
      final cardFinder = find.byType(CardHeader);

      await tester.launchWidget(
          child: CardDisplay(PlunderAWreck()), state: makeGameState());
      final basicCard = tester.widget<CardHeader>(cardFinder);
      expect(basicCard.subHeaderText, '');
    });

    testWidgets('should display the correct sub heading for a quest card',
        (WidgetTester tester) async {
      final cardFinder = find.byType(CardHeader);
      final rumoursOfAnIsland = RumoursOfAnIsland();

      await tester.launchWidget(
          child: CardDisplay(rumoursOfAnIsland), state: makeGameState());
      final questCard = tester.widget<CardHeader>(cardFinder);
      expect(questCard.subHeaderText, rumoursOfAnIsland.getSubHeaderText());
    });

    testWidgets('should display the correct heading for a special card',
        (WidgetTester tester) async {
      final cardFinder = find.byType(CardHeader);

      await tester.launchWidget(
          child: CardDisplay(Mutiny()), state: makeGameState());
      final specialCard = tester.widget<CardHeader>(cardFinder);
      expect(specialCard.subHeaderText, SpecialType.MUTINY.description);
    });
  });
}
