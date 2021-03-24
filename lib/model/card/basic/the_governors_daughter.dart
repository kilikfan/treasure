import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class TheGovernorsDaughter extends Card {
  const TheGovernorsDaughter() : super('The Governor\'s Daughter');

  @override
  List<CardAction> getActions(GameState state) {
    return [
      //TODO - action should allow crew/landlubber payments
      TradeAction('Kidnap the debutante.', [Resource.CREW, Resource.CREW],
          [Resource.CREW, Resource.CREW, Resource.LANDLUBBER, Resource.INFAMY, Resource.INFAMY], soundEffect: SFX_KIDNAP),
      //TODO - action should allow crew/landlubber payments
      TradeAction('Return her for the ransom.', [Resource.CREW], [Resource.DOUBLOON, Resource.DOUBLOON]),
      DiscardAction(description: 'Tell your crew to focus.')
    ];
  }
}
