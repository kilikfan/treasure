import 'package:flutter/services.dart' show rootBundle;

String get _rulesPath => "assets/text/rules.txt";

Future<String> readRules() async {
  final path = _rulesPath;
  return await rootBundle.loadString(path);
}
