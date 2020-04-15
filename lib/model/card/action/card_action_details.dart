import '../../game_result.dart';
import '../../resource.dart';
import '../card.dart';

enum CardDestination { DISCARD, EXILE }

class CardActionDetails {
  final String description;
  final List<Resource> cost;
  final List<Resource> reward;
  final int cardsToScry;
  final GameResult result;
  final Card replacement;
  final CardDestination destination;

  const CardActionDetails(this.cost, this.description,
      {this.reward = const [],
      this.cardsToScry,
      this.result,
      this.replacement,
      this.destination = CardDestination.DISCARD});
}
