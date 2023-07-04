import 'package:flutter/material.dart';
import 'package:spp_pay/models/admin_all_pembayaran_response.dart';
import 'package:spp_pay/services/admin_dashboard_service.dart';

class AdminDashboardViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<AllPembayaran>? _allPembayaran;
  List<AllPembayaran>? get allPembayaran => _allPembayaran;

  void getAllPembayaran() async {
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    final result = await AdminDashboardService().getAllPembayaran();

    try {
      if (result.data != null) {
        _allPembayaran = result.data;
      }
    } catch (e) {}
  }
}
