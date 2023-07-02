import 'package:flutter/material.dart';
import 'package:spp_pay/models/detail_payment_response.dart';
import 'package:spp_pay/services/detail_payment_service.dart';

class DetailPaymentViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _jumlahBayar = '';
  String get jumlahBayar => _jumlahBayar;

  DetailPayment? _listPayment;
  DetailPayment? get listPayment => _listPayment;

  String? _image;
  String? get image => _image;

  void getDetailPayment({String? idPembayaran}) async {
    try {
      _isLoading = true;
      await Future.delayed(const Duration(seconds: 1));

      final detailResult = await DetailPaymentService()
          .getDetailPayment(idPembayaran: idPembayaran);

      _listPayment = detailResult.data;

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
