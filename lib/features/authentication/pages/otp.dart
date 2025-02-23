import 'package:flowa/core/widgets/otpfield.widget.dart';
import 'package:flowa/features/authentication/controller/auth.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OTPPage extends StatefulWidget {
  final String phone;
  const OTPPage({
    super.key,
    required this.phone,
  });

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final resendTimer = ResendTimerController();
  final authState = AuthController();
  @override
  void initState() {
    resendTimer.startTimer();
    super.initState();
  }

  @override
  void dispose() {
    resendTimer.startTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          5.sh.toInt().height,
          Image.asset("assets/img/otp.png"),
          2.sh.toInt().height,
          Text(
            "Enter OTP Code",
            textAlign: TextAlign.center,
            style: context.textTheme.headlineSmall!.copyWith(
                fontSize: 20.sp,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold),
          ).withWidth(100.sw),
          1.sh.toInt().height,
          Text.rich(
            TextSpan(
                text: "Enter the 6-digit verification sent to \n",
                children: [
                  TextSpan(
                      text: widget.phone,
                      style: context.textTheme.bodyMedium!.copyWith(
                          fontSize: 16.sp, color: context.primaryColor))
                ]),
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium!
                .copyWith(fontSize: 16.sp, color: Colors.grey),
          ),
          3.sh.toInt().height,
          CustomOtpField(
              length: 6,
              keyboardType: TextInputType.datetime,
              controller: authState.otpController,
              shape: OtpFieldShape.rounded,
              onCompleted: (otp) {
                print("dd: $otp");
              }),
          3.sh.toInt().height,
          AnimatedBuilder(
            animation: resendTimer,
            builder: (context, child) {
              return resendTimer.resendTime == 0
                  ? CupertinoButton(
                      sizeStyle: CupertinoButtonSize.small,
                      onPressed: () {
                        resendTimer.startTimer();
                      },
                      child: Text(
                        "Resend code",
                        style: context.textTheme.bodyMedium!.copyWith(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [child!, Text("${resendTimer.resendTime} s")],
                    );
            },
            child: Text("Resend code in "),
          ),
          Spacer(
            flex: 2,
          ),
          CupertinoButton.filled(
              onPressed: () {
                authState.login();
                context.pushReplacement("/");
              },
              child: Text(
                "VERIFY",
                style: context.textTheme.bodyMedium!.copyWith(
                    fontSize: 16.sp,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )).withWidth(100.sw).withHeight(8.sh),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not my number?"),
              CupertinoButton(
                sizeStyle: CupertinoButtonSize.small,
                onPressed: () {
                  context.push("/auth/");
                },
                child: Text(
                  "Go Back",
                  style: context.textTheme.bodyMedium!.copyWith(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          Spacer()
        ],
      ).paddingSymmetric(horizontal: 5.sw)),
    );
  }
}
