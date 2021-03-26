import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../model/card/card.dart' as Model;
import 'card/card_display.dart';

class CardViewer extends StatelessWidget {
  final List<Model.Card> cardList;
  final Function getButtons;

  const CardViewer(this.cardList, this.getButtons);

  @override
  Widget build(BuildContext context) {
    final List<Widget> cardWidgetList = cardList.map((card) {
      final List<Widget> buttons = getButtons(context, card);
      final columnComponents = [
        _buildCardNumberWidget(context, cardList, card),
        _buildCardWidget(context, card),
        ...buttons
      ];
      return Container(
          width: MediaQuery.of(context).size.width,
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
            columnComponents
          ));
    }).toList();

    return Swiper(
        itemCount: cardWidgetList.length,
        control: const SwiperControl(),
        loop: false,
        itemBuilder: (BuildContext context, int index) {
          return cardWidgetList[index];
        });
  }

  Widget _buildCardWidget(BuildContext context, Model.Card card) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.65,
        child: CardDisplay(
          card,
          readOnly: true,
        ));
  }

  Widget _buildCardNumberWidget(BuildContext context, List<Model.Card> cardList, Model.Card currentCard) {
    final position = cardList.indexOf(currentCard) + 1;
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        height: MediaQuery.of(context).size.height * 0.045,
        child: Text('$position / ${cardList.length}')
    );
  }

}
