import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  static final AuthController _instance = AuthController._internal();
  factory AuthController() {
    return _instance;
  }
  AuthController._internal();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  bool isAuthenticated = false;
  String phoneCode = "";

  TextEditingController phoneController = TextEditingController();
}
