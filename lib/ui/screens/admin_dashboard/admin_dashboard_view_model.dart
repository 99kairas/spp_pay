// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:spp_pay/models/admin_all_pembayaran_response.dart';
import 'package:spp_pay/models/admin_all_spp_response.dart';
import 'package:spp_pay/services/admin_dashboard_service.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/widgets/scaffold_messenger.dart';

class AdminDashboardViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<AllPembayaran>? _allPembayaran;
  List<AllPembayaran>? get allPembayaran => _allPembayaran;

  List<AllSpp>? _allSpp;
  List<AllSpp>? get allSpp => _allSpp;

  void getAllPembayaran() async {
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    final result = await AdminDashboardService().getAllPembayaran();

    try {
      if (result.data != null) {
        _allPembayaran = result.data;
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  void getAllSpp() async {
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    final result = await AdminDashboardService().getAllSpp();

    try {
      if (result.data != null) {
        _allSpp = result.data;
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  // Property of Add SPP
  TextEditingController tahunSppController = TextEditingController(text: '');
  TextEditingController bulanSppController = TextEditingController(text: '');
  TextEditingController jumlahSppController = TextEditingController(text: '');

  void addSpp(BuildContext context) async {
    final result = await AdminDashboardService().addSpp(
      tahun: 'Tahun Ajaran ${tahunSppController.text}',
      bulan: bulanSppController.text,
      jumlah: double.tryParse(
        jumlahSppController.text,
      ),
    );
    if (result == true &&
        tahunSppController.text.isNotEmpty &&
        bulanSppController.text.isNotEmpty &&
        jumlahSppController.text.isNotEmpty) {
      tahunSppController.clear();
      bulanSppController.clear();
      jumlahSppController.clear();
      scaffoldMessenger(
        context: context,
        title: 'Berhasil Menambahkan Spp',
        color: greenColor,
        result: result,
      );
    } else {
      scaffoldMessenger(
        context: context,
        title: 'Gagal Menambahkan Spp',
        color: redColor,
        result: result,
      );
    }
    notifyListeners();
  }

  void addAllPembayaran(
    BuildContext context,
    String? idSpp,
  ) async {
    try {
      final result = await AdminDashboardService().addAllPembayaran(
        idSpp: idSpp,
      );
      if (result == true) {
        scaffoldMessenger(
          context: context,
          title: 'berhasil menambahkan pembayaran ke semua siswa',
          color: greenColor,
          result: result,
        );
      } else {
        scaffoldMessenger(
          context: context,
          title: 'gagal menambahkan pembayaran ke semua siswa',
          color: redColor,
          result: result,
        );
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
