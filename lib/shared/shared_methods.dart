// import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spp_pay/shared/theme.dart';

// void showCustomSnackbar(BuildContext context, String message) {
//   Flushbar(
//     message: message,
//     flushbarPosition: FlushbarPosition.TOP,
//     backgroundColor: redColor,
//     duration: const Duration(seconds: 2),
//   ).show(context);
// }

class Utility {
  static final rupiah =
      NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0);
}

String formatCurrency(
  num number, {
  String symbol = 'Rp ',
}) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: symbol,
    decimalDigits: 0,
  ).format(number);
}

scaffoldMessengerSuccess({
  required BuildContext context,
  required String title,
}) {
  // Navigator.pop(context);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: greenColor,
      content: Text(title),
    ),
  );
}

scaffoldMessengerFailed({
  required BuildContext context,
  required String title,
}) {
  // Navigator.pop(context);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: redColor,
      content: Text(title),
    ),
  );
}

class SharedPref {
  static SharedPreferences? _preferences;

  static Future<SharedPreferences> get preferences async {
    if (_preferences != null) {
      return _preferences!;
    }

    _preferences = await SharedPreferences.getInstance();
    return _preferences!;
  }

  static Future<void> saveToken(String token) async {
    final prefs = await preferences;
    prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    final prefs = await preferences;
    return prefs.getString('token');
  }

  static Future<void> removeToken() async {
    final prefs = await preferences;
    prefs.remove('token');
  }
}

class APIConstant {
  static String baseUrl = 'http://10.0.2.2:5000/api';
  static String imageUrl = 'http://10.0.2.2:5000';
  static Map<String, String> auth(String token) => {
        "authorization": "$token",
      };
}
