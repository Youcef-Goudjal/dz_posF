import 'package:dz_pos/core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final langManager = LanguageManager.instance;
    final themeManager = ThemeManager.instance;
    return EasyLocalization(
      // default settings
      supportedLocales: langManager.supportedLocales,
      path: langManager.path,
      fallbackLocale: langManager.defaultLanguage,
      useOnlyLangCode: langManager.useOnlyLangCode,
      saveLocale: langManager.saveLocale,
      startLocale: langManager.startLocale,
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            // localization
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            // Theme
            themeMode: themeManager.themeMode,
            theme: themeManager.lightTheme,
            darkTheme: themeManager.darkTheme,
            // Route
            routerConfig: AppRouter.router(),
          );
        },
      ),
    );
  }
}
