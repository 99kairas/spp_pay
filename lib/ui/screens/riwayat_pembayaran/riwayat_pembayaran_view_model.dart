// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:spp_pay/models/pembayaran_response.dart';
import 'package:spp_pay/services/riwayat_pembayaran_service.dart';
import 'package:spp_pay/shared/shared_methods.dart';

class RiwayatPembayaranViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Pembayaran>? _pembayaran;
  List<Pembayaran>? get pembayaran => _pembayaran;

  void getPembayaran(BuildContext context) async {
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 1));

    final result = await RiwayatPembayaranService().getPembayaran();

    try {
      if (result.data.isNotEmpty) {
        _pembayaran = result.data;
      }

      _isLoading = false;

      notifyListeners();
    } catch (e) {
      scaffoldMessengerFailed(context: context, title: e.toString());
    }
  }
}
