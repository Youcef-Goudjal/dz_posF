import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dz_pos/core/manager/language/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();
  final langManager = LanguageManager.instance;
  await runZonedGuarded(
    () async => runApp(
      EasyLocalization(
        // default settings
        supportedLocales: langManager.supportedLocales,
        path: langManager.path,
        fallbackLocale: langManager.defaultLanguage,
        useOnlyLangCode: langManager.useOnlyLangCode,
        saveLocale: langManager.saveLocale,
        startLocale: langManager.startLocale,
        //
        child: await builder(),
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
