import 'package:flutter/material.dart';
import 'package:spp_pay/models/detail_payment_response.dart';
import 'package:spp_pay/services/detail_payment_service.dart';

class DetailPaymentViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _jumlahBayar = '';
  String get jumlahBayar => _jumlahBayar;

  List<DetailPayment> _listPayment = [];
  List<DetailPayment> get listPayment => _listPayment;

  void getDetailPayment({String? idPembayaran}) async {
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 1));

    final detailResult = await DetailPaymentService()
        .getDetailPayment(idPembayaran: idPembayaran);

    _listPayment = detailResult.data;

    _isLoading = false;
    notifyListeners();

    print('HELLO 5 ${detailResult.data}');
  }
}
