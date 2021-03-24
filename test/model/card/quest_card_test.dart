import 'package:flutter_test/flutter_test.dart';
import 'package:treasure_of_the_high_seas/model/card/quest/hispaniola_2_land_ahoy.dart';

void main() {
  test('Subheader should be set correctly for a quest card', () {
    const card = LandAhoy();
    expect(card.getSubHeaderText(), 'Hispaniola 2/4');
  });
}