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
    List<Widget> components;

    List<Widget> cardWidgetList = cardList.map((card) {
      getButtons(context, card, components);
      components.insert(0,
          Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      height: MediaQuery.of(context).size.height * 0.65,
      child: CardDisplay(
      card,
      readOnly: true,
      )));

      return Container(
          width: MediaQuery.of(context).size.width,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children:
            components
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
