import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/basic/a_game_of_cards.dart';

void main() {
  test('Subheader should be blank for a basic card', () {
    const card = AGameOfCards();
    expect(card.getSubHeaderText(), '');
  });
}
