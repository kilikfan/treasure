import 'package:flutter/services.dart' show rootBundle;

String get _rulesPath {
  final path = "assets/text/rules.txt";
  return path;
}

Future<String> readRules() async {
  final path = _rulesPath;
  return await rootBundle.loadString(path);
}
