import 'package:treasure_of_the_high_seas/model/audio/audio_constants.dart';

import '../../game_state.dart';
import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../action/trade_action.dart';
import '../card.dart';

class AGameOfCards extends Card {
  const AGameOfCards() : super('A Game of Cards');

  @override
  List<CardAction> getActions(GameState state) {
    return [
      TradeAction('A straight wins.', [Resource.CREW, Resource.DOUBLOON, Resource.FOOD, Resource.LANDLUBBER, Resource.INFAMY],
          [Resource.MAP], soundEffect: SFX_POKER),
      TradeAction('Better luck next time.', [Resource.DOUBLOON, Resource.DOUBLOON], [], soundEffect: SFX_COINS),
      DiscardAction(description: 'Not worth the risk.')
    ];
  }
}
