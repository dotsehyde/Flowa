import 'package:flowa/core/config/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Spacer(),
          Container(
            width: 100.sw,
            height: 30.sh,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/onboard.png"))),
          ),
          Text(
            APP_NAME,
            textAlign: TextAlign.center,
            style: context.textTheme.headlineSmall!.copyWith(
                fontSize: 18.sp,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold),
          ).withWidth(100.sw),
          4.sh.toInt().height,
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(children: [
              TextSpan(
                  text: 'Experience the ',
                  style: context.textTheme.headlineLarge!.copyWith(
                      fontSize: 27.sp,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: 'easier way',
                  style: context.textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 27.sp,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: ' for transaction!',
                  style: context.textTheme.headlineLarge!.copyWith(
                      fontSize: 27.sp,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold)),
            ]),
          ),
          2.sh.toInt().height,
          Text(
            "Connect your money to your\nfriends & brands.",
            style: context.textTheme.bodyLarge!.copyWith(
                fontSize: 17.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w400),
          ),
          Spacer(),
          CupertinoButton.filled(
                  onPressed: () {
                    setValue("hasOnboarded", true);
                    context.pushReplacement("/auth");
                  },
                  child: Text(
                    "GET STARTED",
                    style: context.textTheme.bodyMedium!.copyWith(
                        fontSize: 16.sp,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ))
              .withWidth(100.sw)
              .withHeight(8.sh)
              .paddingSymmetric(horizontal: 2.sw),
          Spacer()
        ],
      ).paddingSymmetric(horizontal: 3.sw)),
    );
  }
}
