import 'package:flowa/core/widgets/textfield.widget.dart';
import 'package:flowa/features/authentication/controller/auth.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final authState = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            8.sh.toInt().height,
            Image.asset("assets/img/login.png"),
            2.sh.toInt().height,
            Text(
              "Login",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 20.sp,
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold),
            ).withWidth(100.sw),
            1.sh.toInt().height,
            Text(
              "Please enter your phone number,\nto log into your account",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 16.sp, color: Colors.grey),
            ),
            3.sh.toInt().height,
            CustomTextField(
              isPhoneField: true,
              setCountryCode: (cc) {
                authState.phoneCode.value = cc.code;
              },
              validator: (v) {
                if (v!.isEmpty) {
                  return "Phone number is required";
                } else if (v.length > 10 || v.length < 9) {
                  return "Invalid phone number";
                }
                return null;
              },
              countryCodes: [
                CountryCode(label: "🇬🇭 +233", code: "233"),
                CountryCode(label: "🇳🇬 +234", code: "234")
              ],
              textInputAction: TextInputAction.done,
              controller: authState.phoneController,
              keyboardType: TextInputType.phone,
              label: "Phone Number",
            ),
            Spacer(
              flex: 2,
            ),
            CupertinoButton.filled(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.push(
                      "/auth/otp/${authState.phoneCode.value + authState.phoneController.text}",
                    );
                  }
                },
                child: Text(
                  "CONTINUE",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16.sp,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                )).withWidth(100.sw).withHeight(8.sh),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                CupertinoButton(
                  sizeStyle: CupertinoButtonSize.small,
                  onPressed: () {
                    context.push("/auth/signup");
                  },
                  child: Text(
                    "Register",
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
        ).paddingSymmetric(horizontal: 5.sw),
      )),
    );
  }
}
