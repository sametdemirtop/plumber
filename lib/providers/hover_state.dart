import 'package:flutter/material.dart';

class HoverState with ChangeNotifier {
  final Map<String, bool> hoveredButtons = {};
  final Map<String, bool> hoveredCards = {};

  void setButtonHover(String key, bool value) {
    hoveredButtons[key] = value;
    notifyListeners();
  }

  void setCardHover(String key, bool value) {
    hoveredCards[key] = value;
    notifyListeners();
  }

  bool isHoveredButton(String key) => hoveredButtons[key] == true;
  bool isHoveredCard(String key) => hoveredCards[key] == true;
  void setHoveredButton(String key, bool value) => setButtonHover(key, value);
  void setHoveredCard(String key, bool value) => setCardHover(key, value);
}
