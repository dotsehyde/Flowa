import 'package:flowa/core/controller/app.controller.dart';
import 'package:flowa/features/authentication/controller/auth.controller.dart';
import 'package:flowa/features/home/controller/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void registerControllers() {
  Get.put(AppController(), permanent: true);
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => HomeController());
}

class NoAnimationPageTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child; // No transition effect
  }
}
