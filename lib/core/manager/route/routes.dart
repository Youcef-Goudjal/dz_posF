import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes {
  splash('/splash', 'Splash', SizedBox()),
  onBoarding('/start', 'Start', SizedBox()),
  //Home
  home('/', 'Home', SizedBox()),
  // authentication routes
  auth('/auth', 'Auth', SizedBox()),
  login('login', 'Login', SizedBox()),
  loginPhone('loginPhone', 'LoginPhone', SizedBox()),
  forgotPassword('forgotPassword', 'ForgotPassword', SizedBox()),
  resetPassword('resetPassword', 'resetPassword', SizedBox()),
  verifyOtp('verifyOtp', 'VerifyOtp', SizedBox()),
  register('register', 'Register', SizedBox()),

  // error route
  error('/error', 'Error', SizedBox());

  const AppRoutes(this.path, this.name, this.view);

  final String path;
  final String name;
  final Widget view;
  @override
  String toString() => name;

  GoRoute goRoute([
    List<RouteBase>? routes,
    Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder,
  ]) {
    return GoRoute(
      path: path,
      name: name,
      routes: routes ?? [],
      pageBuilder: pageBuilder ??
          (context, state) {
            return MaterialPage(
              key: state.pageKey,
              child: view,
            );
          },
    );
  }
}
