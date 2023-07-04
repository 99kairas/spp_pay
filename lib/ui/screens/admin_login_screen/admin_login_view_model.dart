// ignore_for_file: use_build_context_synchronously, prefer_final_fields

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spp_pay/shared/shared_methods.dart';

class AdminLoginViewModel with ChangeNotifier {
  TextEditingController nisController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Nomor Induk Siswa Property
  String _nis = "";
  String get nis => _nis;
  // End of Nomor Induk Siswa Property

  // Password Property
  String _password = "";
  String get password => _password;

  bool _isHidePassword = true;
  bool get isHidePassword => _isHidePassword;
  // End of Password Property

  void saveToken(String token) {
    SharedPref.saveToken(token);
  }

  void showHidePassword() {
    _isHidePassword = !_isHidePassword;
    notifyListeners();
  }

  loginProvider(BuildContext context) async {
    Dio dio = Dio();

    try {
      final response = await dio.post(
        '${APIConstant.baseUrl}/auth/login/admin',
        data: {
          "username": nisController.text,
          "password": passwordController.text,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        saveToken(response.data['accessToken']);
        scaffoldMessengerSuccess(
          context: context,
          title: response.data['message'],
        );
        navigateToDashboardScreen(context);
      }
    } on DioException catch (e) {
      scaffoldMessengerFailed(
          context: context, title: '${e.response?.data['message']}');
    }
  }

  void navigateToDashboardScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, '/admin-dashboard', (route) => false);

    nisController.clear();
    passwordController.clear();
  }

  void navigateToUserLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
