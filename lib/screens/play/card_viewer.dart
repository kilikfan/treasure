import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:treasure_of_the_high_seas/model/view_mode.dart';

import '../../model/card/card.dart' as Model;
import 'card/card_display.dart';

class CardViewer extends StatelessWidget {
  final List<Model.Card> cardList;
  final ViewMode mode;
  final Function getButtons;

  CardViewer(this.cardList, this.mode, this.getButtons);

  @override
  Widget build(BuildContext context) {
    Widget _getCardWidget(Model.Card card) {
      return Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          height: MediaQuery.of(context).size.height * 0.65,
          child: CardDisplay(
            card,
            readOnly: true,
          ));
    }

    List<Widget> cardWidgetList = cardList.map((card) {
      final List<Widget> buttons = getButtons(context, card);
      final List<Widget> columnComponents = [_getCardWidget(card), ...buttons];

      return Container(
          width: MediaQuery.of(context).size.width,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children:
            columnComponents
          ));
    }).toList();

    return Swiper(
        itemCount: cardWidgetList.length,
        control: new SwiperControl(),
        loop: false,
        itemBuilder: (BuildContext context, int index) {
          return cardWidgetList[index];
        });
  }
}
