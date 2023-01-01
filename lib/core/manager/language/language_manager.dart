import 'package:dz_pos/core/core.dart';
import 'package:flutter/material.dart';

class LanguageManager {
  LanguageManager._init();
  static final LanguageManager _instance = LanguageManager._init();
  static LanguageManager get instance => _instance;

  late Locale defaultLanguage = ar;

  final en = const Locale('en');
  final ar = const Locale('ar');
  final fr = const Locale('fr');

  final path = AppAssets.translations;

  List<Locale> get supportedLocales => [en, fr, ar];

  final bool useOnlyLangCode = true;
  final bool saveLocale = true;

  late final Locale? startLocale = ar;
}
