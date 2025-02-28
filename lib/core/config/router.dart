import 'package:flowa/core/controller/app.controller.dart';
import 'package:flowa/core/pages/bottomNav.dart';
import 'package:flowa/features/authentication/pages/login.dart';
import 'package:flowa/features/authentication/pages/onboarding.dart';
import 'package:flowa/features/authentication/pages/otp.dart';
import 'package:flowa/features/home/pages/electric.dart';
import 'package:flowa/features/home/pages/home.dart';
import 'package:flowa/features/profile/pages/profile.dart';
import 'package:flowa/features/wallet/pages/wallet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

var routes = GoRouter(routes: [
  GoRoute(
    path: "/",
    redirect: (context, state) {
      final appState = AppController.to;
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
  GoRoute(
    path: "/electric",
    builder: (context, state) => ElectricPage(),
  ),
  //Bottom Nav
  StatefulShellRoute.indexedStack(
      builder: (context, state, shell) {
        return BottomNavPage(child: shell);
      },
      branches: [
        StatefulShellBranch(routes: [
          //Home routes
          GoRoute(
              path: "/home",
              builder: (context, state) => HomePage(),
              routes: [
                GoRoute(
                  path: "electric",
                  builder: (context, state) => ElectricPage(),
                )
              ]),
          GoRoute(
            path: "/electric",
            builder: (context, state) => ElectricPage(),
          )
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: "/wallet",
            builder: (context, state) => WalletPage(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: "/profile",
            builder: (context, state) => ProfilePage(),
          )
        ])
      ])
]);
