import 'package:flowa/core/controller/app.controller.dart';
import 'package:flowa/features/authentication/pages/login.dart';
import 'package:flowa/features/authentication/pages/onboarding.dart';
import 'package:flowa/features/authentication/pages/otp.dart';
import 'package:flowa/features/home/pages/home.dart';
import 'package:go_router/go_router.dart';

var routes = GoRouter(routes: [
  GoRoute(
    path: "/",
    redirect: (context, state) {
      final appState = AppController();
      return appState.isAuthenticated
          ? "/home"
          : appState.hasOnboarded
              ? "/auth"
              : "/onboard";
    },
  ),
  GoRoute(path: "/onboard", builder: (context, state) => OnboardingPage()),
  // Auth routes
  GoRoute(path: "/auth", builder: (context, state) => LoginPage(), routes: [
    GoRoute(
      path: "/otp/:phone",
      builder: (context, state) =>
          OTPPage(phone: state.pathParameters['phone'] ?? ""),
    ),
    GoRoute(path: "/signup", builder: (context, state) => OnboardingPage()),
  ]),
  //Home routes
  GoRoute(
    path: "/home",
    builder: (context, state) => HomePage(),
  )
]);
