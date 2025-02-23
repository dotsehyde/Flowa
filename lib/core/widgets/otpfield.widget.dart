import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum OtpFieldShape { square, circle, rounded }

class CustomOtpField extends StatefulWidget {
  final int length;
  final OtpFieldShape shape;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final double fieldSize;
  final double borderRadius;
  final Color fillColor;
  final ValueChanged<String> onCompleted;

  const CustomOtpField({
    super.key,
    required this.length,
    required this.controller,
    this.keyboardType = TextInputType.number,
    this.shape = OtpFieldShape.square,
    this.fieldSize = 50,
    this.borderRadius = 10,
    this.fillColor = Colors.white,
    required this.onCompleted,
  });

  @override
  _CustomOtpFieldState createState() => _CustomOtpFieldState();
}

class _CustomOtpFieldState extends State<CustomOtpField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  String otp = '';

  @override
  void initState() {
    super.initState();
    _controllers =
        List.generate(widget.length, (index) => TextEditingController());
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < widget.length - 1) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
        _setTextSelection(index + 1);
      }
    } else if (value.isEmpty || value == "") {
      if (index > 0) {
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
        _setTextSelection(index - 1);
      }
    }
    _updateOtp();
  }

  void _onPaste(String pastedText) {
    // Remove non-numeric characters
    // pastedText = pastedText.replaceAll(
    //     RegExp(r'[^0-9]'), '');
    if (pastedText.length > widget.length) {
      pastedText = pastedText.substring(0, widget.length); // Trim if too long
    }

    for (int i = 0; i < pastedText.length; i++) {
      _controllers[i].text = pastedText[i];
    }

    FocusScope.of(context).unfocus(); // Move focus away after pasting
    _updateOtp();
  }

  void _updateOtp() {
    otp = _controllers.map((controller) => controller.text).join();
    widget.controller.text = otp;
    if (otp.length == widget.length) {
      widget.onCompleted(otp);
    }
  }

  void _setTextSelection(int index) {
    _controllers[index].selection = TextSelection(
      baseOffset: 0,
      extentOffset: _controllers[index].text.length,
    );
  }

  BoxDecoration _getDecoration(BuildContext context) {
    switch (widget.shape) {
      case OtpFieldShape.circle:
        return BoxDecoration(
          shape: BoxShape.circle,
          color: widget.fillColor,
        );
      case OtpFieldShape.rounded:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: widget.fillColor,
        );
      default:
        return BoxDecoration(
          color: widget.fillColor,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        ClipboardData? clipboardData =
            await Clipboard.getData(Clipboard.kTextPlain);
        if (clipboardData != null && clipboardData.text != null) {
          _onPaste(clipboardData.text!);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              width: widget.fieldSize,
              height: widget.fieldSize,
              decoration: _getDecoration(context),
              alignment: Alignment.center,
              child: TextField(
                onTap: () {
                  _setTextSelection(index);
                },
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                textAlign: TextAlign.center,
                keyboardType: widget.keyboardType,
                maxLength: 1,
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  isDense: true,
                  counterText: '',
                  border: InputBorder.none,
                ),
                onChanged: (value) => _onChanged(value, index),
              ),
            ),
          );
        }),
      ),
    );
  }
}
