import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/screens/play/player_hand.dart';
import 'package:treasure_of_the_high_seas/screens/play/view_active_quests_page.dart';

import '../../model/audio/audio_model_test.mocks.dart';
import '../../test_utils.dart';

void main() {
  testWidgets('close button should return to play page', (WidgetTester tester) async {
    final audioModel = MockAudioModel();
    await launchGameFromMenuMock(tester, audioModel: audioModel);
    await tester.pumpAndSettle();

    final activeQuestsFinder = find.byIcon(Icons.assignment);
    await tester.tap(activeQuestsFinder);
    await tester.pumpAndSettle();

    expect(find.byType(ViewActiveQuestsPage), findsOneWidget);
    expect(find.byType(PlayerHand), findsNothing);

    final exitFinder = find.text('Close');
    await tester.tap(exitFinder);
    await tester.pumpAndSettle();

    expect(find.byType(PlayerHand), findsOneWidget);
  });
}
