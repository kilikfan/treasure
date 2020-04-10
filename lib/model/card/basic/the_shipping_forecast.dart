import '../../resource.dart';
import '../action/card_action.dart';
import '../action/discard_action.dart';
import '../action/scry_action.dart';
import '../card.dart';

class TheShippingForecast extends Card {
    const TheShippingForecast() : super("The Shipping Forecast!");

  @override
  List<CardAction> getActions() {
    return [
      ScryAction("Vision in the entrail.",[Resource.FOOD], 1),
      ScryAction("Visions in the entrails.", [Resource.FOOD, Resource.FOOD], 2),
      DiscardAction("Supplies are running low."),
    ];
  }
}
