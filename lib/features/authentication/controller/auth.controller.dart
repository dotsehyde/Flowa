import 'dart:async';

import 'package:flowa/core/config/constants.dart';
import 'package:flowa/core/controller/app.controller.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  static final AuthController _instance = AuthController._internal();
  factory AuthController() {
    return _instance;
  }
  AuthController._internal();

  //Inject
  final appState = AppController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  String phoneCode = "";

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  void login() {
    appState.isAuthenticated = true;
  }
}

class ResendTimerController extends ChangeNotifier {
  static final ResendTimerController _instance = ResendTimerController._();
  factory ResendTimerController() {
    return _instance;
  }
  ResendTimerController._();

  @override
  void dispose() {
    if (timer.isActive) {
      timer.cancel();
    }
    super.dispose();
  }

  late Timer timer;

  int resendTime = 0;
  void startTimer() {
    resendTime = RESEND_TIME;
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      updateTimer(t.tick);
    });
  }

  void stopTimer() {
    timer.isActive ? timer.cancel() : null;
  }

  void updateTimer(int t) {
    resendTime--;
    notifyListeners();
    if (t == RESEND_TIME) {
      timer.isActive ? timer.cancel() : null;
    }
  }
}
