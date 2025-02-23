import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AppController extends ChangeNotifier {
  static final AppController _instance = AppController._();
  factory AppController() {
    return _instance;
  }
  AppController._();

  bool isAuthenticated = false;
  bool hasOnboarded = getBoolAsync("hasOnboarded", defaultValue: false);
}
