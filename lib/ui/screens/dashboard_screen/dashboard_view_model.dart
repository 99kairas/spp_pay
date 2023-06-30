// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spp_pay/models/pembayaran_response.dart';
import 'package:spp_pay/models/user_information_respnse.dart';
import 'package:spp_pay/services/dashboard_service.dart';
import 'package:spp_pay/shared/shared_methods.dart';

class DashboardViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UserInformation? _user;
  UserInformation? get user => _user;

  List<Pembayaran>? _pembayaran;
  List<Pembayaran>? get pembayaran => _pembayaran;

  void getUserInfo(BuildContext context) async {
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 2));

    final result = await DashboardService().getUserInfo();
    try {
      if (result.data != null) {
        _user = result.data;
      }

      print('HELLO 2 ${user?.namaSiswa}');
    } on DioException catch (e) {
      scaffoldMessengerFailed(
          context: context, title: e.response?.data['message']);
    }
  }

  void getPembayaran(BuildContext context) async {
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    final result = await DashboardService().getPembayaran();

    try {
      if (result.data != null) {
        _pembayaran = result.data;
      }
      _isLoading = false;
      print('HELLO 3 ${_pembayaran?.length}');
      notifyListeners();
      // return _pembayaran;
    } on DioException catch (e) {
      scaffoldMessengerFailed(
          context: context, title: e.response?.data['message']);
    }
  }
}