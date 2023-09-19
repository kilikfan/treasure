import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/screens/play/card/card_pile.dart';
import 'package:treasure_of_the_high_seas/screens/play/play_page.dart';
import 'package:treasure_of_the_high_seas/screens/play/player_hand.dart';
import 'package:treasure_of_the_high_seas/screens/play/view_discard_page.dart';

import '../../model/audio/audio_model_test.mocks.dart';
import '../../test_utils.dart';

void main() {
  testWidgets('close button should return to play page', (WidgetTester tester) async {
    final audioModel = MockAudioModel();
    await launchGameFromMenuMock(tester, audioModel: audioModel);

    final playPage = tester.widget<PlayPage>(find.byType(PlayPage));
    final gameState = playPage.state;

    //Play a couple of cards to populate the discard pile
    gameState.nextCard();
    gameState.nextCard();

    await tester.pumpAndSettle();

    final discardFinder = find.widgetWithText(CardPile, 'Discard: 2');
    expect(discardFinder, findsOneWidget);
    await tester.tap(discardFinder);
    await tester.pumpAndSettle();

    expect(find.byType(ViewDiscardPage), findsOneWidget);
    expect(find.byType(PlayerHand), findsNothing);

    final exitFinder = find.text('Close');
    expect(exitFinder, findsOneWidget);

    await tester.tap(exitFinder);
    await tester.pumpAndSettle();
    expect(find.byType(PlayerHand), findsOneWidget);
  });
}
