import 'package:flutter/material.dart';

import '../../text_utils.dart';

class CardHeader extends StatelessWidget {
  final String headerText;

  CardHeader([this.headerText = '']);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: heading(headerText),
    );
  }
}
