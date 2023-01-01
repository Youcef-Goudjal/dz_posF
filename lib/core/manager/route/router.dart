import 'package:dz_pos/core/core.dart';
import 'package:dz_pos/features/features.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter router() {
    final appService = sl<ApplicationBloc>().appService;
    return GoRouter(
      refreshListenable: appService,
      routes: [
        AppRoutes.splash.goRoute(),
        AppRoutes.onBoarding.goRoute(),
        AppRoutes.auth.goRoute(),
        AppRoutes.home.goRoute(),
        AppRoutes.error.goRoute(),
      ],
      redirect: (context, state) {
        final loginLocation = AppRoutes.auth.path;
        final homeLocation = AppRoutes.home.path;
        final splashLocation = AppRoutes.splash.path;
        final onboardLocation = AppRoutes.onBoarding.path;

        final isLogedIn = appService.loginState;
        final isInitialized = appService.initialized;
        final isOnboarded = appService.onboarding;

        final isGoingToLogin = state.subloc == loginLocation;
        final isGoingToInit = state.subloc == splashLocation;
        final isGoingToOnboard = state.subloc == onboardLocation;
        // If not Initialized and not going to Initilized redirect to Splash
        if (!isInitialized && !isGoingToInit) {
          return splashLocation;
          // If not onboard and not going to onboard redirect to OnBoard
        } else if (isInitialized && !isOnboarded && !isGoingToOnboard) {
          return onboardLocation;
          // If not loggedIn and not going to login redirect to Auth
        } else if (isInitialized &&
            isOnboarded &&
            !isLogedIn &&
            !isGoingToLogin) {
          return loginLocation;
          // If All the scenarios are cleared but still going to any of that
          //screen redirect to Home
        } else if ((isLogedIn && isGoingToLogin) ||
            (isInitialized && isGoingToInit) ||
            (isOnboarded && isGoingToOnboard)) {
          return homeLocation;
        } else {
          // Else Don't do anything
          return null;
        }
      },
    );
  }
}
