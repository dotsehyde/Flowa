import 'package:flowa/core/controller/app.controller.dart';
import 'package:flowa/core/widgets/otpfield.widget.dart';
import 'package:flowa/features/authentication/controller/auth.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  @override
  void initState() {
    ResendTimerController.to.startTimer();
    super.initState();
  }

  @override
  void dispose() {
    ResendTimerController.to.startTimer();
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
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
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
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16.sp, color: context.primaryColor))
                ]),
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 16.sp, color: Colors.grey),
          ),
          3.sh.toInt().height,
          CustomOtpField(
              length: 6,
              fieldSize: 27.8.sp,
              keyboardType: TextInputType.datetime,
              controller: AuthController.to.otpController,
              shape: OtpFieldShape.rounded,
              onCompleted: (otp) {
                // print("dd: $otp");
              }),
          3.sh.toInt().height,
          Obx(
            () {
              return ResendTimerController.to.resendTime.value == 0
                  ? CupertinoButton(
                      sizeStyle: CupertinoButtonSize.small,
                      onPressed: () {
                        ResendTimerController.to.startTimer();
                      },
                      child: Text(
                        "Resend code",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Resend code in "),
                        Text("${ResendTimerController.to.resendTime.value} s")
                      ],
                    );
            },
          ),
          Spacer(
            flex: 2,
          ),
          CupertinoButton.filled(
              onPressed: () {
                AppController.to.isAuthenticated = true;
                context.go("/");
              },
              child: Text(
                "VERIFY",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                  context.replace("/auth/");
                },
                child: Text(
                  "Go Back",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
