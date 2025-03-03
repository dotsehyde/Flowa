import 'dart:async';

import 'package:flowa/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find<AuthController>();

  @override
  void onClose() {
    phoneController.dispose();
    otpController.dispose();
    super.onClose();
  }

  var phoneCode = "".obs;

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
}

class ResendTimerController extends GetxController {
  static ResendTimerController to = Get.find<ResendTimerController>();
  late Timer timer;
  var resendTime = 0.obs;

  @override
  void onClose() {
    if (timer.isActive) {
      timer.cancel();
    }
    super.onClose();
  }

  void startTimer() {
    resendTime.value = RESEND_TIME;
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      updateTimer(t.tick);
    });
  }

  void stopTimer() {
    timer.isActive ? timer.cancel() : null;
  }

  void updateTimer(int t) {
    resendTime.value--;
    if (t == RESEND_TIME) {
      timer.isActive ? timer.cancel() : null;
    }
  }
}
