import 'package:dz_pos/core/core.dart';
import 'package:flutter/material.dart';

class AppService with ChangeNotifier {
  bool _loginState = false;
  bool _initialized = false;
  bool _onboarding = false;

  bool get loginState => _loginState;
  bool get initialized => _initialized;
  bool get onboarding => _onboarding;

  set loginState(bool state) {
    _loginState = state;
    notifyListeners();
  }

  set initialized(bool state) {
    _initialized = state;
    notifyListeners();
  }

  set onboarding(bool state) {
    _onboarding = state;
    notifyListeners();
  }

  Future<void> onAppStart() async {
    // load settings

    // show splash screen
    await 2.delay(); // waiting 2 seconds
    initialized = true;
  }
}
