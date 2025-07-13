import 'package:flutter/material.dart';

class MenuState with ChangeNotifier {
  bool isMobileMenuOpen = false;

  void toggleMenu() {
    isMobileMenuOpen = !isMobileMenuOpen;
    notifyListeners();
  }

  void closeMenu() {
    isMobileMenuOpen = false;
    notifyListeners();
  }

  void toggleMobileMenu() {
    isMobileMenuOpen = !isMobileMenuOpen;
    notifyListeners();
  }

  void closeMobileMenu() {
    isMobileMenuOpen = false;
    notifyListeners();
  }
}
