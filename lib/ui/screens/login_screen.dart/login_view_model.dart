// ignore_for_file: use_build_context_synchronously, prefer_final_fields

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spp_pay/shared/shared_methods.dart';

class LoginViewModel with ChangeNotifier {
  TextEditingController nisController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Button Prorerty
  bool _isButtonNisDisable = false;
  bool get isButtonNisDisable => _isButtonNisDisable;

  bool _isButtonPasswordDisable = false;
  bool get isButtonPasswordDisable => _isButtonPasswordDisable;
  // End Button

  // Nomor Induk Siswa Property
  String _nis = "";
  String get nis => _nis;

  bool _isNisValid = true;
  bool get isNisValid => _isNisValid;

  String _errorNisMessage = "";
  String get errorNisMessage => _errorNisMessage;

  bool _isButtonNisValid = false;
  bool get isButtonNisValid => _isButtonNisValid;

  void validateNIS(String value) {
    _nis = value;
    if (_nis.isEmpty) {
      _isNisValid = false;
      _isButtonNisValid = false;
      _errorNisMessage = "Nomor Induk Siswa Tidak Boleh Kosong!";
    } else {
      _isButtonNisValid = true;
      _isNisValid = true;
    }
    notifyListeners();
  }
  // End of Nomor Induk Siswa Property

  // Password Property
  String _password = "";
  String get password => _password;

  bool _isPasswordValid = true;
  bool get isPasswordValid => _isPasswordValid;

  String _errorPasswordMessage = "";
  String get errorPasswordMessage => _errorPasswordMessage;

  bool _isHidePassword = true;
  bool get isHidePassword => _isHidePassword;

  bool _isButtonPasswordValid = false;
  bool get isButtonPasswordValid => _isButtonPasswordValid;

  void validatePassword(String value) {
    _password = value;
    if (_password.isEmpty) {
      _errorPasswordMessage = "Password Tidak Boleh Kosong";
      _isPasswordValid = false;
      _isButtonPasswordValid = false;
    } else if (_password[0] != _password[0].toUpperCase()) {
      _errorPasswordMessage = "Password harus di awali huruf Besar";
      _isPasswordValid = false;
      _isButtonPasswordValid = false;
    } else if (_password.length < 4) {
      _errorPasswordMessage = "Password harus lebih dari 4";
      _isPasswordValid = false;
      _isButtonPasswordValid = false;
    } else if (RegExp(r'^[a-z A-Z]+$').hasMatch(_password)) {
      _errorPasswordMessage = "Password minimal memiliki angka";
      _isPasswordValid = false;
      _isButtonPasswordValid = false;
    } else {
      _isButtonPasswordValid = true;
      _isPasswordValid = true;
    }
    notifyListeners();
  }
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
        '${APIConstant.baseUrl}/auth/login',
        data: {
          "no_induk_siswa": nisController.text,
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
    Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (route) => false);

    nisController.clear();
    passwordController.clear();
  }

  void navigateToAdminLoginScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, '/admin-login', (route) => false);
  }
}
