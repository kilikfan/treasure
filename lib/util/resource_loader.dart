import 'package:flutter/services.dart';

class ResourceLoader {
  const ResourceLoader();

  Future<String> readTextResource(String path) async => rootBundle.loadString(path);
}