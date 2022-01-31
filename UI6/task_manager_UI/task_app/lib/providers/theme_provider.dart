import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _light = true;

  void toggle() {
    _light = !_light;
    notifyListeners();
  }

  bool get light {
    return _light;
  }

  set light(bool light) {
    _light = light;
    notifyListeners();
  }
}
