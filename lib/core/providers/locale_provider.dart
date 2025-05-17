import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('ar');
  final SharedPreferences _prefs;

  LocaleProvider(this._prefs) {
    _loadSavedLocale();
  }

  Locale get locale => _locale;

  void _loadSavedLocale() {
    String? languageCode = _prefs.getString('language_code');
    if (languageCode != null) {
      _locale = Locale(languageCode);
    }
  }

  Future<void> setLocale(Locale locale) async {
    if (!['en', 'ar'].contains(locale.languageCode)) return;
    
    _locale = locale;
    await _prefs.setString('language_code', locale.languageCode);
    notifyListeners();
  }

  Future<void> toggleLocale() async {
    final newLocale = _locale.languageCode == 'ar' ? const Locale('en') : const Locale('ar');
    await setLocale(newLocale);
  }
} 