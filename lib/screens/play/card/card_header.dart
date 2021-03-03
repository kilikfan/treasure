import 'package:flutter/material.dart';

import '../../text_utils.dart';

class CardHeader extends StatelessWidget {
  final String headerText;
  final String subHeaderText;

  CardHeader([this.headerText = '', this.subHeaderText = '']);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          heading(headerText),
          Text(
            subHeaderText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )
        ]));
  }
}
