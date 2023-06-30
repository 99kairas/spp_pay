// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spp_pay/shared/shared_methods.dart';

class SplashViewModel with ChangeNotifier {
  void checkUserLogin(BuildContext context) async {
    Timer(const Duration(seconds: 5), () async {
      var cekDataLogin = await SharedPref.getToken();

      if (cekDataLogin != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/dashboard', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      }
    });
  }
}
