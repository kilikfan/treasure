import 'package:treasure_of_the_high_seas/model/card/special_card_types.dart';

import 'card.dart';
import 'card_types.dart';

abstract class SpecialCard extends Card {
  final SpecialType specialType;

  const SpecialCard(String name, this.specialType,
      {type: CardType.SPECIAL})
      : super(name, type: type);

  @override
  String getSubHeaderText() =>
      "${this.specialType.description}";
}