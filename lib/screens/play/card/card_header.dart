import 'package:flutter/material.dart';

import '../../text_utils.dart';

class CardHeader extends StatelessWidget {
  final String headerText;
  final String subHeaderText;

  CardHeader([this.headerText = '', this.subHeaderText = '']);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: _getHeadings(headerText, subHeaderText)));
  }

  List<Widget> _getHeadings(String headerText, String subHeaderText) {
    //Card heading should always be displayed
    final headings = [heading(headerText)];

    //Only make room for a subheader if we have one
    if (subHeaderText != '') {
      headings.add(Text(
        subHeaderText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ));
    }

    return headings;
  }
}
