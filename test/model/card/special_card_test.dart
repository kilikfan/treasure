import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/special/mutiny.dart';
import 'package:treasure_of_the_high_seas/model/card/special_card_types.dart';

void main() {
  test('Subheader should be set correctly for a special card', () {
    const card = Mutiny();
    expect(card.getSubHeaderText(), SpecialType.MUTINY.description);
  });
}
