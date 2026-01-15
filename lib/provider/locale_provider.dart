import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tafl_app/data/locale.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleNotifier extends Notifier<Locale>
{
    @override
  Locale build()
  {
    _init();
    return kSupportedLocale.first;
  }

  static String localePreference = 'localePreference';

  void switchLocale(Locale locale) async
  {
    if (state == locale)
    {
      return;
    }
    if (kSupportedLocale.contains(locale))
    {
      state = locale;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(localePreference, locale.languageCode);
    }
  }

  Future<void> _init() async
  {
    final prefs = await SharedPreferences.getInstance();
    String? localePref = prefs.getString(localePreference);
    if (localePref == null)
    {
      return;
    }

    final locale = Locale(localePref);
    if (kSupportedLocale.contains(locale))
    {
      state = locale;
    }

  }

}

final localeProvider = NotifierProvider<LocaleNotifier, Locale>(LocaleNotifier.new
);

final supportedLocaleProvider = Provider<List<Locale>>((ref) {
  return kSupportedLocale;
});


/*
final locale = kSupportedLocale.firstWhere(
  (l) => l.languageCode == code,
  orElse: () => kSupportedLocale.first,
);
state = locale;
*/
