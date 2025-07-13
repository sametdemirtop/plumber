import 'package:flutter/foundation.dart';

class HoverState extends ChangeNotifier {
  final Map<String, bool> _hoveredButtons = {};
  final Map<String, bool> _hoveredCards = {};

  bool isHoveredButton(String buttonId) {
    return _hoveredButtons[buttonId] ?? false;
  }

  bool isHoveredCard(String cardId) {
    return _hoveredCards[cardId] ?? false;
  }

  void setHoveredButton(String buttonId, bool isHovered) {
    if (_hoveredButtons[buttonId] != isHovered) {
      _hoveredButtons[buttonId] = isHovered;
      notifyListeners();
    }
  }

  void setHoveredCard(String cardId, bool isHovered) {
    if (_hoveredCards[cardId] != isHovered) {
      _hoveredCards[cardId] = isHovered;
      notifyListeners();
    }
  }

  void clearAllHoverStates() {
    _hoveredButtons.clear();
    _hoveredCards.clear();
    notifyListeners();
  }
}
