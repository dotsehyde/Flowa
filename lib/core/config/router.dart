import 'package:flowa/features/authentication/controller/auth.controller.dart';
import 'package:flowa/features/authentication/pages/login.dart';
import 'package:flowa/features/authentication/pages/onboarding.dart';
import 'package:go_router/go_router.dart';

var routes = GoRouter(routes: [
  GoRoute(
    path: "/",
    redirect: (context, state) {
      final authState = AuthController();
      return authState.isAuthenticated ? "/home" : "/onboard";
    },
  ),
  GoRoute(path: "/onboard", builder: (context, state) => OnboardingPage()),
  // Auth routes
  GoRoute(path: "/auth", builder: (context, state) => LoginPage(), routes: [
    GoRoute(path: "/signup", builder: (context, state) => OnboardingPage()),
  ]),
  //Home routes
  GoRoute(
    path: "/home",
    builder: (context, state) => OnboardingPage(),
  )
]);
