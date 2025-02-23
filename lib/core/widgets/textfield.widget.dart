import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool isPhoneField;
  final bool isPasswordField;
  final Widget? prefix;
  final void Function(CountryCode)? setCountryCode;
  final List<CountryCode>? countryCodes;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  const CustomTextField(
      {super.key,
      required this.label,
      this.validator,
      this.prefix,
      this.countryCodes,
      this.setCountryCode,
      this.isPhoneField = false,
      this.isPasswordField = false,
      required this.keyboardType,
      required this.textInputAction,
      required this.controller})
      : assert(
            !isPhoneField || (countryCodes != null && setCountryCode != null));

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late CountryCode? countryCode;
  bool showPassword = false;
  @override
  void initState() {
    if (widget.isPhoneField) {
      countryCode = widget.countryCodes![0];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPasswordField ? !showPassword : false,
      validator: widget.validator,
      style: context.textTheme.bodyMedium!
          .copyWith(color: Colors.black, fontSize: 15.sp),
      decoration: InputDecoration(
        prefixIcon: widget.prefix,
        prefix: !widget.isPhoneField
            ? null
            : DropdownButtonHideUnderline(
                child: DropdownButton<CountryCode>(
                    padding: EdgeInsets.zero,
                    icon: VerticalDivider(
                      color: Colors.grey,
                    ),
                    enableFeedback: true,
                    isDense: true,
                    dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    value: countryCode,
                    items: widget.countryCodes!.map((e) {
                      return DropdownMenuItem<CountryCode>(
                        value: e,
                        child: Text(
                          e.label,
                          style: context.textTheme.bodyMedium!
                              .copyWith(color: Colors.grey.shade600),
                        ),
                      );
                    }).toList(),
                    onChanged: (v) {
                      widget.setCountryCode!(v!);
                      setState(() {
                        countryCode = v;
                      });
                    }),
              ),
        suffixIcon: !widget.isPasswordField
            ? null
            : CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                child: Icon(
                  showPassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                )),
        labelText: widget.label,
        labelStyle: context.textTheme.bodyMedium!
            .copyWith(color: Colors.black, fontSize: 15.sp),
        border: Theme.of(context).inputDecorationTheme.border,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
      ),
    );
  }
}

class CountryCode {
  final String label;
  final String code;
  CountryCode({required this.label, required this.code});
}
