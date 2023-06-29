import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  void navigateToDashboard(BuildContext context) {
    Navigator.pushNamed(context, '/dashboard-screen');
  }
}
