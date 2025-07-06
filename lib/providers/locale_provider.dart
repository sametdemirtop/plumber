import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('tr');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!['en', 'tr'].contains(locale.languageCode)) return;

    _locale = locale;
    notifyListeners();
  }

  void toggleLocale() {
    _locale =
        _locale.languageCode == 'tr' ? const Locale('en') : const Locale('tr');
    notifyListeners();
  }
}
