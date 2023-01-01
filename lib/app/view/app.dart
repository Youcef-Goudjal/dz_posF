import 'package:dz_pos/core/core.dart';
import 'package:dz_pos/counter/counter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final langManager = LanguageManager.instance;
    return EasyLocalization(
      // default settings
      supportedLocales: langManager.supportedLocales,
      path: langManager.path,
      fallbackLocale: langManager.defaultLanguage,
      useOnlyLangCode: langManager.useOnlyLangCode,
      saveLocale: langManager.saveLocale,
      startLocale: langManager.startLocale,
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
        ),
        // translations
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const CounterPage(),
      ),
    );
  }
}
