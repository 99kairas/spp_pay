import 'dart:async';

import 'package:flutter/material.dart';

class SplashViewModel with ChangeNotifier {
  void checkUserLogin(BuildContext context) async {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/login-screen', (route) => false);
    });
  }
}
